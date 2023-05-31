-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Orientation_request_constraint exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| unique or primary key constraints on table "orientation\_request"

  - Orientation\_request\_pkey - unique or primary key constraint on columns "id"

-}
type Orientation_request_constraint
    = Orientation_request_pkey


list : List Orientation_request_constraint
list =
    [ Orientation_request_pkey ]


decoder : Decoder Orientation_request_constraint
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "orientation_request_pkey" ->
                        Decode.succeed Orientation_request_pkey

                    _ ->
                        Decode.fail ("Invalid Orientation_request_constraint type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Orientation_request_constraint -> String
toString enum____ =
    case enum____ of
        Orientation_request_pkey ->
            "orientation_request_pkey"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Orientation_request_constraint
fromString enumString____ =
    case enumString____ of
        "orientation_request_pkey" ->
            Just Orientation_request_pkey

        _ ->
            Nothing