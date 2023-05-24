-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Object.Admin_cdb_max_fields exposing (..)

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


createdAt : SelectionSet (Maybe CdbGQL.ScalarCodecs.Timestamptz) CdbGQL.Object.Admin_cdb_max_fields
createdAt =
    Object.selectionForField "(Maybe ScalarCodecs.Timestamptz)" "createdAt" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder |> Decode.nullable)


email : SelectionSet (Maybe CdbGQL.ScalarCodecs.Citext) CdbGQL.Object.Admin_cdb_max_fields
email =
    Object.selectionForField "(Maybe ScalarCodecs.Citext)" "email" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecCitext |> .decoder |> Decode.nullable)


firstname : SelectionSet (Maybe String) CdbGQL.Object.Admin_cdb_max_fields
firstname =
    Object.selectionForField "(Maybe String)" "firstname" [] (Decode.string |> Decode.nullable)


id : SelectionSet (Maybe CdbGQL.ScalarCodecs.Uuid) CdbGQL.Object.Admin_cdb_max_fields
id =
    Object.selectionForField "(Maybe ScalarCodecs.Uuid)" "id" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder |> Decode.nullable)


lastname : SelectionSet (Maybe String) CdbGQL.Object.Admin_cdb_max_fields
lastname =
    Object.selectionForField "(Maybe String)" "lastname" [] (Decode.string |> Decode.nullable)


updatedAt : SelectionSet (Maybe CdbGQL.ScalarCodecs.Timestamptz) CdbGQL.Object.Admin_cdb_max_fields
updatedAt =
    Object.selectionForField "(Maybe ScalarCodecs.Timestamptz)" "updatedAt" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder |> Decode.nullable)
