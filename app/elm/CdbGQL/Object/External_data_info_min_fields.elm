-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Object.External_data_info_min_fields exposing (..)

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


beneficiary_id : SelectionSet (Maybe CdbGQL.ScalarCodecs.Uuid) CdbGQL.Object.External_data_info_min_fields
beneficiary_id =
    Object.selectionForField "(Maybe ScalarCodecs.Uuid)" "beneficiary_id" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder |> Decode.nullable)


created_at : SelectionSet (Maybe CdbGQL.ScalarCodecs.Timestamptz) CdbGQL.Object.External_data_info_min_fields
created_at =
    Object.selectionForField "(Maybe ScalarCodecs.Timestamptz)" "created_at" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder |> Decode.nullable)


external_data_id : SelectionSet (Maybe CdbGQL.ScalarCodecs.Uuid) CdbGQL.Object.External_data_info_min_fields
external_data_id =
    Object.selectionForField "(Maybe ScalarCodecs.Uuid)" "external_data_id" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder |> Decode.nullable)


professional_id : SelectionSet (Maybe CdbGQL.ScalarCodecs.Uuid) CdbGQL.Object.External_data_info_min_fields
professional_id =
    Object.selectionForField "(Maybe ScalarCodecs.Uuid)" "professional_id" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder |> Decode.nullable)


updated_at : SelectionSet (Maybe CdbGQL.ScalarCodecs.Timestamptz) CdbGQL.Object.External_data_info_min_fields
updated_at =
    Object.selectionForField "(Maybe ScalarCodecs.Timestamptz)" "updated_at" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder |> Decode.nullable)
