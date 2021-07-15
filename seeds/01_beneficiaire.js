/* eslint-disable @typescript-eslint/explicit-module-boundary-types */
export async function seed(knex) {
	return knex('beneficiary')
		.del()
		.then(function () {
			return knex('beneficiary').insert([
				{
					id: 'a81bc81b-dead-4e5d-abff-90865d1e13b1',
					caf_number: '12345',
					pe_number: '89879',
					civil_status: {
						civility: 'Monsieur',
						lastname: 'Laroche',
						firstname: 'Jean'
					},
					contact: {
						email: 'jean.laroche@cdb.com',
						mobile_number: '0660203040'
					},
					address: {
						postal_code: '26150',
						city: 'Die',
						address1: '26 rue Camille Buffardel'
					}
				}
			]);
		});
}
