-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Object.Account_aggregate_fields exposing (..)

import CdbGQL.Enum.Account_select_column
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


type alias CountOptionalArguments =
    { columns : OptionalArgument (List CdbGQL.Enum.Account_select_column.Account_select_column)
    , distinct : OptionalArgument Bool
    }


count :
    (CountOptionalArguments -> CountOptionalArguments)
    -> SelectionSet Int CdbGQL.Object.Account_aggregate_fields
count fillInOptionals____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { columns = Absent, distinct = Absent }

        optionalArgs____ =
            [ Argument.optional "columns" filledInOptionals____.columns (Encode.enum CdbGQL.Enum.Account_select_column.toString |> Encode.list), Argument.optional "distinct" filledInOptionals____.distinct Encode.bool ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForField "Int" "count" optionalArgs____ Decode.int


max :
    SelectionSet decodesTo CdbGQL.Object.Account_max_fields
    -> SelectionSet (Maybe decodesTo) CdbGQL.Object.Account_aggregate_fields
max object____ =
    Object.selectionForCompositeField "max" [] object____ (Basics.identity >> Decode.nullable)


min :
    SelectionSet decodesTo CdbGQL.Object.Account_min_fields
    -> SelectionSet (Maybe decodesTo) CdbGQL.Object.Account_aggregate_fields
min object____ =
    Object.selectionForCompositeField "min" [] object____ (Basics.identity >> Decode.nullable)
