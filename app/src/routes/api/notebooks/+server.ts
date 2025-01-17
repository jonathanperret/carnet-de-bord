import { getGraphqlAPI, getRdvISecret } from '$lib/config/variables/private';
import { error } from '@sveltejs/kit';
import * as yup from 'yup';
import { createClient } from '@urql/core';

import type { RequestHandler } from './$types';
import { createGraphqlAdminClient } from '$lib/graphql/createAdminClient';
import {
	GetAccountByEmailDocument,
	RoleEnum,
	type GetAccountByEmailQuery,
	CreateNotebookDocument,
	type CreateNotebookMutation,
	type CreateNotebookMutationVariables,
} from '$lib/graphql/_gen/typed-document-nodes';
import { logger } from '$lib/utils/logger';
import { createJwt } from '$lib/utils/getJwt';

const bodySchema = yup.object().shape({
	rdviUserEmail: yup.string().required(),
	deploymentId: yup.string().uuid().required(),
	notebook: yup.object().shape({
		nir: yup.string().required(),
		externalId: yup.string(),
		firstname: yup.string().required(),
		lastname: yup.string().required(),
		// we keep the date as a string to let
		// Hasura to be the single point of validation
		dateOfBirth: yup.string().required(),
		mobileNumber: yup.string(),
		email: yup.string(),
		address1: yup.string(),
		address2: yup.string(),
		postalCode: yup.string(),
		city: yup.string(),
		cafNumber: yup.string(),
	}),
});
type BodyType = yup.InferType<typeof bodySchema>;

const client = createGraphqlAdminClient();

export const POST = (async ({ request }) => {
	const authorization = request.headers.get('authorization');

	if (!authorization) {
		throw error(401, { message: 'missing authorization' });
	}

	if (authorization.substring('Bearer '.length) !== getRdvISecret()) {
		throw error(403, { message: 'wrong authorization' });
	}

	let body: BodyType;
	try {
		body = await request.json();
	} catch (bodyParsingError) {
		// do nothing the validate function will throw a more accurate error
	}

	try {
		await bodySchema.validate(body);
	} catch (validationError) {
		throw error(422, { message: `${validationError.message}` });
	}

	//
	const accountResult = await client
		.query<GetAccountByEmailQuery>(GetAccountByEmailDocument, {
			criteria: {
				_and: [
					{ deletedAt: { _is_null: true } },
					{
						manager: {
							email: { _eq: body.rdviUserEmail },
							deploymentId: { _eq: body.deploymentId },
						},
					},
				],
			},
		})
		.toPromise();

	if (accountResult.error) {
		logger.error(accountResult.error);
		throw error(500, { message: 'Internal server error' });
	}

	if (accountResult.data.account.length === 0) {
		logger.error(`manager account ${body.rdviUserEmail} not found`);
		throw error(400, { message: 'manager account not found' });
	}

	const accountId = accountResult.data.account[0].id;

	const jwt = createJwt({
		id: accountId,
		type: RoleEnum.Manager,
		deploymentId: body.deploymentId,
	});

	const authorizedClient = createClient({
		fetch,
		fetchOptions: {
			headers: {
				'Content-Type': 'application/json',
				Authorization: `Bearer ${jwt}`,
			},
		},
		requestPolicy: 'network-only',
		url: getGraphqlAPI(),
	});

	// TODO:
	//	- Ajouter des tests et adapter le code pour gérer les erreurs retournées par la mutation
	const createNotebookResult = await authorizedClient
		.mutation<CreateNotebookMutation, CreateNotebookMutationVariables>(CreateNotebookDocument, {
			notebook: body.notebook,
		})
		.toPromise();

	if (createNotebookResult.error) {
		if (createNotebookResult.error.graphQLErrors) {
			const gqlError = createNotebookResult.error.graphQLErrors[0];
			if (gqlError.extensions.error_code === 409) {
				throw error(409, { ...gqlError });
			}
		}
		throw error(400, { message: createNotebookResult.error.toString() });
	}
	return new Response(
		JSON.stringify({ notebookId: createNotebookResult.data.create_notebook.notebookId }),
		{ status: 201 }
	);
}) satisfies RequestHandler;
