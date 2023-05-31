-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Notebook_event_type_update_column exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| update columns of table "notebook\_event\_type"

  - Comment - column name
  - Value - column name

-}
type Notebook_event_type_update_column
    = Comment
    | Value


list : List Notebook_event_type_update_column
list =
    [ Comment, Value ]


decoder : Decoder Notebook_event_type_update_column
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "comment" ->
                        Decode.succeed Comment

                    "value" ->
                        Decode.succeed Value

                    _ ->
                        Decode.fail ("Invalid Notebook_event_type_update_column type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Notebook_event_type_update_column -> String
toString enum____ =
    case enum____ of
        Comment ->
            "comment"

        Value ->
            "value"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Notebook_event_type_update_column
fromString enumString____ =
    case enumString____ of
        "comment" ->
            Just Comment

        "value" ->
            Just Value

        _ ->
            Nothing