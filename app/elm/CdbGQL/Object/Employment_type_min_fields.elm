-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Object.Employment_type_min_fields exposing (..)

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


id : SelectionSet (Maybe String) CdbGQL.Object.Employment_type_min_fields
id =
    Object.selectionForField "(Maybe String)" "id" [] (Decode.string |> Decode.nullable)


label : SelectionSet (Maybe String) CdbGQL.Object.Employment_type_min_fields
label =
    Object.selectionForField "(Maybe String)" "label" [] (Decode.string |> Decode.nullable)
