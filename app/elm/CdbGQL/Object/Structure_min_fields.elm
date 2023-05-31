-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Object.Structure_min_fields exposing (..)

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


address1 : SelectionSet (Maybe String) CdbGQL.Object.Structure_min_fields
address1 =
    Object.selectionForField "(Maybe String)" "address1" [] (Decode.string |> Decode.nullable)


address2 : SelectionSet (Maybe String) CdbGQL.Object.Structure_min_fields
address2 =
    Object.selectionForField "(Maybe String)" "address2" [] (Decode.string |> Decode.nullable)


city : SelectionSet (Maybe String) CdbGQL.Object.Structure_min_fields
city =
    Object.selectionForField "(Maybe String)" "city" [] (Decode.string |> Decode.nullable)


createdAt : SelectionSet (Maybe CdbGQL.ScalarCodecs.Timestamptz) CdbGQL.Object.Structure_min_fields
createdAt =
    Object.selectionForField "(Maybe ScalarCodecs.Timestamptz)" "createdAt" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder |> Decode.nullable)


deploymentId : SelectionSet (Maybe CdbGQL.ScalarCodecs.Uuid) CdbGQL.Object.Structure_min_fields
deploymentId =
    Object.selectionForField "(Maybe ScalarCodecs.Uuid)" "deploymentId" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder |> Decode.nullable)


email : SelectionSet (Maybe String) CdbGQL.Object.Structure_min_fields
email =
    Object.selectionForField "(Maybe String)" "email" [] (Decode.string |> Decode.nullable)


id : SelectionSet (Maybe CdbGQL.ScalarCodecs.Uuid) CdbGQL.Object.Structure_min_fields
id =
    Object.selectionForField "(Maybe ScalarCodecs.Uuid)" "id" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecUuid |> .decoder |> Decode.nullable)


name : SelectionSet (Maybe CdbGQL.ScalarCodecs.Citext) CdbGQL.Object.Structure_min_fields
name =
    Object.selectionForField "(Maybe ScalarCodecs.Citext)" "name" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecCitext |> .decoder |> Decode.nullable)


phone : SelectionSet (Maybe String) CdbGQL.Object.Structure_min_fields
phone =
    Object.selectionForField "(Maybe String)" "phone" [] (Decode.string |> Decode.nullable)


postalCode : SelectionSet (Maybe String) CdbGQL.Object.Structure_min_fields
postalCode =
    Object.selectionForField "(Maybe String)" "postalCode" [] (Decode.string |> Decode.nullable)


shortDesc : SelectionSet (Maybe String) CdbGQL.Object.Structure_min_fields
shortDesc =
    Object.selectionForField "(Maybe String)" "shortDesc" [] (Decode.string |> Decode.nullable)


siret : SelectionSet (Maybe String) CdbGQL.Object.Structure_min_fields
siret =
    Object.selectionForField "(Maybe String)" "siret" [] (Decode.string |> Decode.nullable)


updatedAt : SelectionSet (Maybe CdbGQL.ScalarCodecs.Timestamptz) CdbGQL.Object.Structure_min_fields
updatedAt =
    Object.selectionForField "(Maybe ScalarCodecs.Timestamptz)" "updatedAt" [] (CdbGQL.ScalarCodecs.codecs |> CdbGQL.Scalar.unwrapCodecs |> .codecTimestamptz |> .decoder |> Decode.nullable)


website : SelectionSet (Maybe String) CdbGQL.Object.Structure_min_fields
website =
    Object.selectionForField "(Maybe String)" "website" [] (Decode.string |> Decode.nullable)