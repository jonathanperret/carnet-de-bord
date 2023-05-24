-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Nps_rating_dismissal_constraint exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| unique or primary key constraints on table "nps\_rating\_dismissal"

  - Nps\_rating\_dismissal\_pkey - unique or primary key constraint on columns "id"

-}
type Nps_rating_dismissal_constraint
    = Nps_rating_dismissal_pkey


list : List Nps_rating_dismissal_constraint
list =
    [ Nps_rating_dismissal_pkey ]


decoder : Decoder Nps_rating_dismissal_constraint
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "nps_rating_dismissal_pkey" ->
                        Decode.succeed Nps_rating_dismissal_pkey

                    _ ->
                        Decode.fail ("Invalid Nps_rating_dismissal_constraint type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Nps_rating_dismissal_constraint -> String
toString enum____ =
    case enum____ of
        Nps_rating_dismissal_pkey ->
            "nps_rating_dismissal_pkey"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Nps_rating_dismissal_constraint
fromString enumString____ =
    case enumString____ of
        "nps_rating_dismissal_pkey" ->
            Just Nps_rating_dismissal_pkey

        _ ->
            Nothing
