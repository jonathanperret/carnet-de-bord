module OrientationHome.Main exposing (Flags, GqlQuery, Model, Msg(..), OrientationHomeInfos, OrientationInfosVariables, main)

import Browser
import Html exposing (Html, a, div, h2, h3, p, text)
import Html.Attributes exposing (class, href, title)
import Http
import Json.Decode as Decode
import Json.Encode as Json


type alias Flags =
    { accountId : String }


type alias Model =
    { accountId : String, orientationHomeInfos : Maybe OrientationHomeInfos }


type Msg
    = HomeInfosResult (Result Http.Error OrientationHomeInfos)


type alias OrientationHomeInfos =
    { nbWithReferent : Int
    , nbWithoutReferent : Int
    , nbWithoutStructure : Int
    , nbOrientationRequest : Int
    , nbOtherWithReferent : Int
    , nbOtherWithoutReferent : Int
    , nbOtherWithoutStructure : Int
    , nbOtherOrientationRequest : Int
    }


type alias OrientationInfosVariables =
    { id : String
    }


type alias GqlQuery =
    { query : String
    , variables : OrientationInfosVariables
    }


orientationHomeInfoDecoder : Decode.Decoder OrientationHomeInfos
orientationHomeInfoDecoder =
    let
        beneficiaryWithReferentParser =
            Decode.field "data"
                (Decode.field "beneficiaryWitReferentCount"
                    (Decode.field "aggregate"
                        (Decode.field "count" Decode.int)
                    )
                )

        beneficiaryWithoutReferentParser =
            Decode.field "data"
                (Decode.field "beneficiaryWithoutReferentCount"
                    (Decode.field "aggregate"
                        (Decode.field "count" Decode.int)
                    )
                )

        beneficiaryWithoutStructureParser =
            Decode.field "data"
                (Decode.field "beneficiaryWithoutStructureCount"
                    (Decode.field "aggregate"
                        (Decode.field "count" Decode.int)
                    )
                )

        orientationRequestParser =
            Decode.field "data"
                (Decode.field "orientationRequestCount"
                    (Decode.field "aggregate"
                        (Decode.field "count" Decode.int)
                    )
                )

        otherBeneficiaryWithReferentParser =
            Decode.field "data"
                (Decode.field "otherBeneficiaryWithReferentCount"
                    (Decode.field "aggregate"
                        (Decode.field "count" Decode.int)
                    )
                )

        otherBeneficiaryWithoutReferentParser =
            Decode.field "data"
                (Decode.field "otherBeneficiaryWithoutReferentCount"
                    (Decode.field "aggregate"
                        (Decode.field "count" Decode.int)
                    )
                )

        otherBeneficiaryWithoutStructureParser =
            Decode.field "data"
                (Decode.field "otherBeneficiaryWithoutStructureCount"
                    (Decode.field "aggregate"
                        (Decode.field "count" Decode.int)
                    )
                )

        otherOrientationRequestParser =
            Decode.field "data"
                (Decode.field "otherOrientationRequestCount"
                    (Decode.field "aggregate"
                        (Decode.field "count" Decode.int)
                    )
                )
    in
    Decode.map8 OrientationHomeInfos
        beneficiaryWithReferentParser
        beneficiaryWithoutReferentParser
        beneficiaryWithoutStructureParser
        orientationRequestParser
        otherBeneficiaryWithReferentParser
        otherBeneficiaryWithoutReferentParser
        otherBeneficiaryWithoutStructureParser
        otherOrientationRequestParser


encodeGqlQuery : GqlQuery -> Json.Value
encodeGqlQuery record =
    Json.object
        [ ( "query", Json.string <| record.query )
        , ( "variables", encodeGqlQueryVariables <| record.variables )
        ]


encodeGqlQueryVariables : OrientationInfosVariables -> Json.Value
encodeGqlQueryVariables record =
    Json.object
        [ ( "id", Json.string <| record.id )
        ]


getOrientationHomeInfos : String -> (Result Http.Error OrientationHomeInfos -> msg) -> Cmd msg
getOrientationHomeInfos accountId toMsg =
    let
        gqlQuery =
            { query = """
query GetBeneficiaryDashboard($id: uuid!) {
  beneficiaryWitReferentCount: beneficiary_aggregate(
    where: {
      notebook: {
        _and: [
          { members: { accountId: { _eq: $id }, active: { _eq: true } } }
          { members: { memberType: { _eq: "referent" }, active: { _eq: true } } }
        ]
      }
    }
  ) {
    aggregate {
      count
    }
  }
  beneficiaryWithoutReferentCount: beneficiary_aggregate(
    where: {
      notebook: {
          members: { accountId: { _eq: $id }, active: { _eq: true } }
        _not: { members: { memberType: { _eq: "referent" }, active: { _eq: true } } }

      }
      structures: { status: { _eq: "current" } }
    }
  ) {
    aggregate {
      count
    }
  }
  beneficiaryWithoutStructureCount: beneficiary_aggregate(
    where: {
      notebook: {
        members: { accountId: { _eq: $id }, active: { _eq: true } }
        _not: { members: { memberType: { _eq: "referent" }, active: { _eq: true } } }

      }
      _not : { structures: { status: { _eq: "current" } } }
    }
  ) {
    aggregate {
      count
    }
  }
  orientationRequestCount: beneficiary_aggregate(
    where: {
      notebook: { members: { accountId: { _eq: $id }, active: { _eq: true } } }
      orientationRequest: { decidedAt: { _is_null: true } }
    }
  ) {
    aggregate {
      count
    }
  }
  otherBeneficiaryWithReferentCount: beneficiary_aggregate(
    where: {
      notebook: {
        _not: { members: { accountId: { _eq: $id }, active: { _eq: true } } }
        members: { memberType: { _eq: "referent" }, active: { _eq: true } }
      }
    }
  ) {
    aggregate {
      count
    }
  }
  otherBeneficiaryWithoutReferentCount: beneficiary_aggregate(
    where: {
      notebook: {
        _and: [
          { _not: { members: { accountId: { _eq: $id }, active: { _eq: true } } } }
          { _not: { members: { memberType: { _eq: "referent" }, active: { _eq: true } } } }
        ]
      }
      structures: { status: { _eq: "current" } }
    }
  ) {
    aggregate {
      count
    }
  }
  otherBeneficiaryWithoutStructureCount: beneficiary_aggregate(
    where: {
      notebook: {
        _and: [
          { _not: { members: { accountId: { _eq: $id }, active: { _eq: true } } } }
          { _not: { members: { memberType: { _eq: "referent" }, active: { _eq: true } } } }
        ]
      }
      _not: { structures: { status: { _eq: "current" } } }
    }
  ) {
    aggregate {
      count
    }
  }
  otherOrientationRequestCount: beneficiary_aggregate(
    where: {
      notebook: { _not: { members: { accountId: { _eq: $id }, active: { _eq: true } } } }
      orientationRequest: { decidedAt: { _is_null: true } }
    }
  ) {
    aggregate {
      count
    }
  }
}

      """
            , variables = { id = accountId }
            }
    in
    Http.request
        { method = "POST"
        , headers = [ ]
        , url = "/graphql"
        , body = Http.jsonBody (encodeGqlQuery gqlQuery)
        , expect = Http.expectJson toMsg orientationHomeInfoDecoder
        , timeout = Nothing
        , tracker = Nothing
        }


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        model =
            { accountId = flags.accountId, orientationHomeInfos = Nothing }
    in
    ( model
    , getOrientationHomeInfos
        model.accountId
        HomeInfosResult
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HomeInfosResult result ->
            case result of
                Ok infos ->
                    ( { model | orientationHomeInfos = Just infos }, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    let
        extractString : (OrientationHomeInfos -> Int) -> String
        extractString accessor =
            Maybe.withDefault "--" (Maybe.map (accessor >> String.fromInt) model.orientationHomeInfos)

        -- -- For educational purpose, same as above
        -- extractIntCase : (OrientationHomeInfos -> Int) -> Int
        -- extractIntCase accessor =
        --     case model.orientationHomeInfos of
        --         Just orientationHomeInfos ->
        --             accessor orientationHomeInfos
        --         Nothing ->
        --             0
    in
    div [ class "flex flex-col gap-4" ]
        [ h2 [ class "fr-h4 text-vert-cdb" ]
            [ text "Mon portefeuille  d'orientation" ]
        , div
            [ class "fr-grid-row fr-grid-row--gutters" ]
            [ card "Bénéficiaires accompagnés"
                "Liste des bénéficiaires accompagnés"
                "/orientation/beneficiaires?statut=referent&brsa=suivi"
                (extractString .nbWithReferent)
            , card "Bénéficiaires en attente de référent"
                "Liste des bénéficiaires en attente de référent"
                "/orientation/beneficiaires?statut=sans-referent&brsa=suivi"
                (extractString .nbWithoutReferent)
            , card "Bénéficiaires non accompagnés"
                "Liste des bénéficiaires non accompagnés"
                "/orientation/beneficiaires?statut=sans-structure&brsa=suivi"
                (extractString .nbWithoutStructure)
            , card "Demandes de réorientation"
                "Liste des demandes de réorientation"
                "/orientation/beneficiaires?statut=demande-reo&brsa=suivi"
                (extractString .nbOrientationRequest)
            ]
        , h2 [ class "fr-h4 text-vert-cdb" ]
            [ text "Autres bénéficiaires de mon territoire" ]
        , div
            [ class "fr-grid-row fr-grid-row--gutters" ]
            [ card "Bénéficiaires accompagnés"
                "Liste des autres bénéficiaires accompagnés"
                "/orientation/beneficiaires?statut=referent&brsa=non-suivi"
                (extractString .nbOtherWithReferent)
            , card "Bénéficiaires en attente de référent"
                "Liste des autres bénéficiaires en attente de référent"
                "/orientation/beneficiaires?statut=sans-referent&brsa=non-suivi"
                (extractString .nbOtherWithoutReferent)
            , card "Bénéficiaires non accompagnés"
                "Liste des autres bénéficiaires non accompagnés"
                "/orientation/beneficiaires?statut=sans-structure&brsa=non-suivi"
                (extractString .nbOtherWithoutStructure)
            , card "Demandes de réorientation"
                "Liste des autres demandes de réorientation"
                "/orientation/beneficiaires?statut=demande-reo&brsa=non-suivi"
                (extractString .nbOtherOrientationRequest)
            ]
        ]


card : String -> String -> String -> String -> Html msg
card label cardTitle url value =
    div [ class "fr-col-sm-6 fr-col-md-3 fr-col-lg-3" ]
        [ div
            [ class "fr-card fr-enlarge-link"
            ]
            [ div
                [ class "fr-card__body"
                ]
                [ div
                    [ class "fr-card__content"
                    ]
                    [ h3
                        [ class "fr-card__title"
                        ]
                        [ a
                            [ href url
                            , title cardTitle
                            ]
                            [ text value ]
                        ]
                    , p
                        [ class "fr-card__desc"
                        ]
                        [ text label ]
                    ]
                ]
            , div
                [ class "fr-card__header"
                ]
                []
            ]
        ]
