import json
from uuid import UUID

from asyncpg import Record
from asyncpg.connection import Connection

from api.db.models.beneficiary import Beneficiary
from api.db.models.external_data import (
    ExternalData,
    ExternalDataInfo,
    ExternalDataInfoInsert,
    ExternalDataInsert,
    ExternalSource,
)
from cdb_csv.json_encoder import CustomEncoder


async def parse_external_data_from_record(record: Record) -> ExternalData:
    return ExternalData(
        id=record["id"],
        source=record["source"],
        data=json.loads(record["data"]),
        created_at=record["created_at"],
        updated_at=record["updated_at"],
        hash=record["hash"],
        info=None,
    )


async def update_external_data(
    connection: Connection, external_data: ExternalData
) -> ExternalData | None:

    record = await connection.fetchrow(
        """
            UPDATE external_data set source = $1, data = $2, hash = $3
            WHERE external_data.id = $4
            returning id, source, data, hash, created_at, updated_at
            """,
        external_data.source,
        json.dumps(external_data.data, cls=CustomEncoder),
        external_data.hash,
        external_data.id,
    )

    if record:
        external_data.source = record["source"]
        external_data.data = json.loads(record["data"])
        external_data.updated_at = record["updated_at"]
        external_data.hash = record["hash"]
        return external_data


async def get_last_external_data_by_beneficiary_id_and_source(
    connection: Connection, beneficiary_id: UUID, source: ExternalSource
) -> ExternalData | None:
    async with connection.transaction():

        external_data_record: Record | None = await connection.fetchrow(
            "SELECT external_data.*, external_data_info.created_at as info_created_at, "
            "external_data_info.updated_at as info_updated_at "
            "FROM external_data "
            "LEFT JOIN external_data_info "
            "ON external_data_info.external_data_id = external_data.id "
            "WHERE external_data_info.beneficiary_id = $1 "
            "AND external_data.source = $2 "
            "ORDER BY created_at DESC",
            beneficiary_id,
            source,
        )

        if external_data_record:

            info = ExternalDataInfo(
                external_data_id=external_data_record["id"],
                beneficiary_id=beneficiary_id,
                created_at=external_data_record["info_created_at"],
                updated_at=external_data_record["info_updated_at"],
            )
            external_data = ExternalData(
                id=external_data_record["id"],
                source=external_data_record["source"],
                data=json.loads(external_data_record["data"]),
                created_at=external_data_record["created_at"],
                updated_at=external_data_record["updated_at"],
                hash=external_data_record["hash"],
                info=info,
            )

            return external_data


async def insert_external_data(
    connection: Connection, external_data_insert: ExternalDataInsert
) -> ExternalData | None:

    record = await connection.fetchrow(
        """
            INSERT INTO public.external_data (source, data, hash)
            VALUES ($1, $2, $3) returning id, source, data, hash, created_at, updated_at
            """,
        external_data_insert.source,
        json.dumps(external_data_insert.data, cls=CustomEncoder),
        external_data_insert.hash,
    )

    if record:
        return await parse_external_data_from_record(record)


async def insert_external_data_info(
    connection: Connection, external_info_insert: ExternalDataInfoInsert
) -> ExternalDataInfo | None:

    v = await connection.fetchrow(
        """
            INSERT INTO public.external_data_info (external_data_id, beneficiary_id)
            VALUES ($1, $2) returning external_data_id, beneficiary_id, created_at, updated_at
            """,
        external_info_insert.external_data_id,
        external_info_insert.beneficiary_id,
    )

    if v:
        return ExternalDataInfo.parse_obj(v)


async def insert_external_data_for_beneficiary(
    connection: Connection,
    beneficiary: Beneficiary,
    source: ExternalSource,
    data: dict,
    hash: str,
) -> ExternalData | None:

    external_data_insert = ExternalDataInsert(source=source, data=data, hash=hash)
    external_data: ExternalData | None = await insert_external_data(
        connection, external_data_insert
    )

    if external_data:
        external_info_insert = ExternalDataInfoInsert(
            external_data_id=external_data.id, beneficiary_id=beneficiary.id
        )
        external_info: ExternalDataInfo | None = await insert_external_data_info(
            connection, external_info_insert
        )

        external_data.info = external_info

        return external_data