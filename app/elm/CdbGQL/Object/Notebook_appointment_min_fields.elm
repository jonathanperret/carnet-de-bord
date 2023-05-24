-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Object.Notebook_appointment_min_fields exposing (..)

import CdbGQL.InputObject
import CdbGQL.Interface
import CdbGQL.Object
import CdbGQL.Scalar
import CdbGQL.ScalarCodecs
import CdbGQL.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


created_at : SelectionSet (Maybe CdbGQL.ScalarCodecs.Timestamptz) CdbGQL.Object.Notebook_appointment_min_fields
created_at =
    Object.selectionForField "(Maybe ScalarCodecs.Timestamptz)" "created_at" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder |> Decode.nullable)


date : SelectionSet (Maybe CdbGQL.ScalarCodecs.Timestamp) CdbGQL.Object.Notebook_appointment_min_fields
date =
    Object.selectionForField "(Maybe ScalarCodecs.Timestamp)" "date" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamp |> .decoder |> Decode.nullable)


deleted_at : SelectionSet (Maybe CdbGQL.ScalarCodecs.Timestamptz) CdbGQL.Object.Notebook_appointment_min_fields
deleted_at =
    Object.selectionForField "(Maybe ScalarCodecs.Timestamptz)" "deleted_at" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder |> Decode.nullable)


deleted_by : SelectionSet (Maybe CdbGQL.ScalarCodecs.Uuid) CdbGQL.Object.Notebook_appointment_min_fields
deleted_by =
    Object.selectionForField "(Maybe ScalarCodecs.Uuid)" "deleted_by" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder |> Decode.nullable)


id : SelectionSet (Maybe CdbGQL.ScalarCodecs.Uuid) CdbGQL.Object.Notebook_appointment_min_fields
id =
    Object.selectionForField "(Maybe ScalarCodecs.Uuid)" "id" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder |> Decode.nullable)


memberAccountId : SelectionSet (Maybe CdbGQL.ScalarCodecs.Uuid) CdbGQL.Object.Notebook_appointment_min_fields
memberAccountId =
    Object.selectionForField "(Maybe ScalarCodecs.Uuid)" "memberAccountId" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder |> Decode.nullable)


notebookId : SelectionSet (Maybe CdbGQL.ScalarCodecs.Uuid) CdbGQL.Object.Notebook_appointment_min_fields
notebookId =
    Object.selectionForField "(Maybe ScalarCodecs.Uuid)" "notebookId" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder |> Decode.nullable)


status : SelectionSet (Maybe String) CdbGQL.Object.Notebook_appointment_min_fields
status =
    Object.selectionForField "(Maybe String)" "status" [] (Decode.string |> Decode.nullable)


updated_at : SelectionSet (Maybe CdbGQL.ScalarCodecs.Timestamptz) CdbGQL.Object.Notebook_appointment_min_fields
updated_at =
    Object.selectionForField "(Maybe ScalarCodecs.Timestamptz)" "updated_at" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder |> Decode.nullable)
