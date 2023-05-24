-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Employment_type_constraint exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| unique or primary key constraints on table "employment\_type"

  - Employment\_type\_pkey - unique or primary key constraint on columns "id"

-}
type Employment_type_constraint
    = Employment_type_pkey


list : List Employment_type_constraint
list =
    [ Employment_type_pkey ]


decoder : Decoder Employment_type_constraint
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "employment_type_pkey" ->
                        Decode.succeed Employment_type_pkey

                    _ ->
                        Decode.fail ("Invalid Employment_type_constraint type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Employment_type_constraint -> String
toString enum____ =
    case enum____ of
        Employment_type_pkey ->
            "employment_type_pkey"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Employment_type_constraint
fromString enumString____ =
    case enumString____ of
        "employment_type_pkey" ->
            Just Employment_type_pkey

        _ ->
            Nothing
