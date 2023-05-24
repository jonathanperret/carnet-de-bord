-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Notebook_event_constraint exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| unique or primary key constraints on table "notebook\_event"

  - Notebook\_event\_pkey - unique or primary key constraint on columns "id"

-}
type Notebook_event_constraint
    = Notebook_event_pkey


list : List Notebook_event_constraint
list =
    [ Notebook_event_pkey ]


decoder : Decoder Notebook_event_constraint
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "notebook_event_pkey" ->
                        Decode.succeed Notebook_event_pkey

                    _ ->
                        Decode.fail ("Invalid Notebook_event_constraint type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Notebook_event_constraint -> String
toString enum____ =
    case enum____ of
        Notebook_event_pkey ->
            "notebook_event_pkey"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Notebook_event_constraint
fromString enumString____ =
    case enumString____ of
        "notebook_event_pkey" ->
            Just Notebook_event_pkey

        _ ->
            Nothing
