-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Notebook_info_update_column exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| update columns of table "notebook\_info"

  - CreatedAt - column name
  - NeedOrientation - column name
  - NotebookId - column name
  - OrientationReason - column name
  - OrientationSystemId - column name
  - UpdatedAt - column name

-}
type Notebook_info_update_column
    = CreatedAt
    | NeedOrientation
    | NotebookId
    | OrientationReason
    | OrientationSystemId
    | UpdatedAt


list : List Notebook_info_update_column
list =
    [ CreatedAt, NeedOrientation, NotebookId, OrientationReason, OrientationSystemId, UpdatedAt ]


decoder : Decoder Notebook_info_update_column
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "createdAt" ->
                        Decode.succeed CreatedAt

                    "needOrientation" ->
                        Decode.succeed NeedOrientation

                    "notebookId" ->
                        Decode.succeed NotebookId

                    "orientationReason" ->
                        Decode.succeed OrientationReason

                    "orientationSystemId" ->
                        Decode.succeed OrientationSystemId

                    "updatedAt" ->
                        Decode.succeed UpdatedAt

                    _ ->
                        Decode.fail ("Invalid Notebook_info_update_column type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Notebook_info_update_column -> String
toString enum____ =
    case enum____ of
        CreatedAt ->
            "createdAt"

        NeedOrientation ->
            "needOrientation"

        NotebookId ->
            "notebookId"

        OrientationReason ->
            "orientationReason"

        OrientationSystemId ->
            "orientationSystemId"

        UpdatedAt ->
            "updatedAt"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Notebook_info_update_column
fromString enumString____ =
    case enumString____ of
        "createdAt" ->
            Just CreatedAt

        "needOrientation" ->
            Just NeedOrientation

        "notebookId" ->
            Just NotebookId

        "orientationReason" ->
            Just OrientationReason

        "orientationSystemId" ->
            Just OrientationSystemId

        "updatedAt" ->
            Just UpdatedAt

        _ ->
            Nothing
