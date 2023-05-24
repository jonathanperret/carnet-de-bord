-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module CdbGQL.Enum.Rsa_suspension_reason_enum exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-|

  - Caf\_action\_non\_engagee - Action non engagée
  - Caf\_activite\_anterieur\_insuffisante - Activité antérieure insuffisante
  - Caf\_activite\_anterieure\_absente - Activité antérieure absente
  - Caf\_activite\_anterieure\_non\_conforme - Activité antérieure non conforme
  - Caf\_activite\_non\_conforme - Activité non conforme
  - Caf\_allocataire\_absent - Allocataire absent du foyer
  - Caf\_attente\_decision\_PCG - Attente décision PCG (le droit reste théorique jusqu'au retour)
  - Caf\_beneficiaire\_aah - Bénéficiaire AAH réduite
  - Caf\_declaration\_ressource\_non\_fournie - Déclaration Trimestrielle Ressources non fournie
  - Caf\_demande\_avantage\_vieillesse\_absent - Demande avantage vieillesse absent ou tardif
  - Caf\_droit\_eteint - Droit éteint ou autre cas
  - Caf\_etudiant\_remuneration\_insuffisante - Étudiant rémunération insuffisante
  - Caf\_hospitalisation - Hospitalisation
  - Caf\_moins\_25\_sans\_personne\_charge - Moins de 25 ans sans enfant ni autre personne à charge
  - Caf\_pas\_allocataire - Pas d'allocataire
  - Caf\_pas\_isolement - Pas d'isolement
  - Caf\_prestation\_exclue - Prestation exclue affiliation partielle
  - Caf\_regime\_non\_conforme - Régime non conforme
  - Caf\_residence\_non\_conforme - Résidence non conforme
  - Caf\_ressources\_trop\_elevees - Ressources trop élévées
  - Caf\_rsa\_inferieur\_seuil - RSA inférieur au seuil
  - Caf\_surface\_ponderee\_sup - Surface pondérée supérieure au plafond ou inconnue
  - Caf\_titre\_sejour\_absent - Titre de séjour absent
  - Caf\_titre\_sejour\_invalid - Titre de séjour non valide

-}
type Rsa_suspension_reason_enum
    = Caf_action_non_engagee
    | Caf_activite_anterieur_insuffisante
    | Caf_activite_anterieure_absente
    | Caf_activite_anterieure_non_conforme
    | Caf_activite_non_conforme
    | Caf_allocataire_absent
    | Caf_attente_decision_PCG
    | Caf_beneficiaire_aah
    | Caf_declaration_ressource_non_fournie
    | Caf_demande_avantage_vieillesse_absent
    | Caf_droit_eteint
    | Caf_etudiant_remuneration_insuffisante
    | Caf_hospitalisation
    | Caf_moins_25_sans_personne_charge
    | Caf_pas_allocataire
    | Caf_pas_isolement
    | Caf_prestation_exclue
    | Caf_regime_non_conforme
    | Caf_residence_non_conforme
    | Caf_ressources_trop_elevees
    | Caf_rsa_inferieur_seuil
    | Caf_surface_ponderee_sup
    | Caf_titre_sejour_absent
    | Caf_titre_sejour_invalid


list : List Rsa_suspension_reason_enum
list =
    [ Caf_action_non_engagee, Caf_activite_anterieur_insuffisante, Caf_activite_anterieure_absente, Caf_activite_anterieure_non_conforme, Caf_activite_non_conforme, Caf_allocataire_absent, Caf_attente_decision_PCG, Caf_beneficiaire_aah, Caf_declaration_ressource_non_fournie, Caf_demande_avantage_vieillesse_absent, Caf_droit_eteint, Caf_etudiant_remuneration_insuffisante, Caf_hospitalisation, Caf_moins_25_sans_personne_charge, Caf_pas_allocataire, Caf_pas_isolement, Caf_prestation_exclue, Caf_regime_non_conforme, Caf_residence_non_conforme, Caf_ressources_trop_elevees, Caf_rsa_inferieur_seuil, Caf_surface_ponderee_sup, Caf_titre_sejour_absent, Caf_titre_sejour_invalid ]


decoder : Decoder Rsa_suspension_reason_enum
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "caf_action_non_engagee" ->
                        Decode.succeed Caf_action_non_engagee

                    "caf_activite_anterieur_insuffisante" ->
                        Decode.succeed Caf_activite_anterieur_insuffisante

                    "caf_activite_anterieure_absente" ->
                        Decode.succeed Caf_activite_anterieure_absente

                    "caf_activite_anterieure_non_conforme" ->
                        Decode.succeed Caf_activite_anterieure_non_conforme

                    "caf_activite_non_conforme" ->
                        Decode.succeed Caf_activite_non_conforme

                    "caf_allocataire_absent" ->
                        Decode.succeed Caf_allocataire_absent

                    "caf_attente_decision_PCG" ->
                        Decode.succeed Caf_attente_decision_PCG

                    "caf_beneficiaire_aah" ->
                        Decode.succeed Caf_beneficiaire_aah

                    "caf_declaration_ressource_non_fournie" ->
                        Decode.succeed Caf_declaration_ressource_non_fournie

                    "caf_demande_avantage_vieillesse_absent" ->
                        Decode.succeed Caf_demande_avantage_vieillesse_absent

                    "caf_droit_eteint" ->
                        Decode.succeed Caf_droit_eteint

                    "caf_etudiant_remuneration_insuffisante" ->
                        Decode.succeed Caf_etudiant_remuneration_insuffisante

                    "caf_hospitalisation" ->
                        Decode.succeed Caf_hospitalisation

                    "caf_moins_25_sans_personne_charge" ->
                        Decode.succeed Caf_moins_25_sans_personne_charge

                    "caf_pas_allocataire" ->
                        Decode.succeed Caf_pas_allocataire

                    "caf_pas_isolement" ->
                        Decode.succeed Caf_pas_isolement

                    "caf_prestation_exclue" ->
                        Decode.succeed Caf_prestation_exclue

                    "caf_regime_non_conforme" ->
                        Decode.succeed Caf_regime_non_conforme

                    "caf_residence_non_conforme" ->
                        Decode.succeed Caf_residence_non_conforme

                    "caf_ressources_trop_elevees" ->
                        Decode.succeed Caf_ressources_trop_elevees

                    "caf_rsa_inferieur_seuil" ->
                        Decode.succeed Caf_rsa_inferieur_seuil

                    "caf_surface_ponderee_sup" ->
                        Decode.succeed Caf_surface_ponderee_sup

                    "caf_titre_sejour_absent" ->
                        Decode.succeed Caf_titre_sejour_absent

                    "caf_titre_sejour_invalid" ->
                        Decode.succeed Caf_titre_sejour_invalid

                    _ ->
                        Decode.fail ("Invalid Rsa_suspension_reason_enum type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Rsa_suspension_reason_enum -> String
toString enum____ =
    case enum____ of
        Caf_action_non_engagee ->
            "caf_action_non_engagee"

        Caf_activite_anterieur_insuffisante ->
            "caf_activite_anterieur_insuffisante"

        Caf_activite_anterieure_absente ->
            "caf_activite_anterieure_absente"

        Caf_activite_anterieure_non_conforme ->
            "caf_activite_anterieure_non_conforme"

        Caf_activite_non_conforme ->
            "caf_activite_non_conforme"

        Caf_allocataire_absent ->
            "caf_allocataire_absent"

        Caf_attente_decision_PCG ->
            "caf_attente_decision_PCG"

        Caf_beneficiaire_aah ->
            "caf_beneficiaire_aah"

        Caf_declaration_ressource_non_fournie ->
            "caf_declaration_ressource_non_fournie"

        Caf_demande_avantage_vieillesse_absent ->
            "caf_demande_avantage_vieillesse_absent"

        Caf_droit_eteint ->
            "caf_droit_eteint"

        Caf_etudiant_remuneration_insuffisante ->
            "caf_etudiant_remuneration_insuffisante"

        Caf_hospitalisation ->
            "caf_hospitalisation"

        Caf_moins_25_sans_personne_charge ->
            "caf_moins_25_sans_personne_charge"

        Caf_pas_allocataire ->
            "caf_pas_allocataire"

        Caf_pas_isolement ->
            "caf_pas_isolement"

        Caf_prestation_exclue ->
            "caf_prestation_exclue"

        Caf_regime_non_conforme ->
            "caf_regime_non_conforme"

        Caf_residence_non_conforme ->
            "caf_residence_non_conforme"

        Caf_ressources_trop_elevees ->
            "caf_ressources_trop_elevees"

        Caf_rsa_inferieur_seuil ->
            "caf_rsa_inferieur_seuil"

        Caf_surface_ponderee_sup ->
            "caf_surface_ponderee_sup"

        Caf_titre_sejour_absent ->
            "caf_titre_sejour_absent"

        Caf_titre_sejour_invalid ->
            "caf_titre_sejour_invalid"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Rsa_suspension_reason_enum
fromString enumString____ =
    case enumString____ of
        "caf_action_non_engagee" ->
            Just Caf_action_non_engagee

        "caf_activite_anterieur_insuffisante" ->
            Just Caf_activite_anterieur_insuffisante

        "caf_activite_anterieure_absente" ->
            Just Caf_activite_anterieure_absente

        "caf_activite_anterieure_non_conforme" ->
            Just Caf_activite_anterieure_non_conforme

        "caf_activite_non_conforme" ->
            Just Caf_activite_non_conforme

        "caf_allocataire_absent" ->
            Just Caf_allocataire_absent

        "caf_attente_decision_PCG" ->
            Just Caf_attente_decision_PCG

        "caf_beneficiaire_aah" ->
            Just Caf_beneficiaire_aah

        "caf_declaration_ressource_non_fournie" ->
            Just Caf_declaration_ressource_non_fournie

        "caf_demande_avantage_vieillesse_absent" ->
            Just Caf_demande_avantage_vieillesse_absent

        "caf_droit_eteint" ->
            Just Caf_droit_eteint

        "caf_etudiant_remuneration_insuffisante" ->
            Just Caf_etudiant_remuneration_insuffisante

        "caf_hospitalisation" ->
            Just Caf_hospitalisation

        "caf_moins_25_sans_personne_charge" ->
            Just Caf_moins_25_sans_personne_charge

        "caf_pas_allocataire" ->
            Just Caf_pas_allocataire

        "caf_pas_isolement" ->
            Just Caf_pas_isolement

        "caf_prestation_exclue" ->
            Just Caf_prestation_exclue

        "caf_regime_non_conforme" ->
            Just Caf_regime_non_conforme

        "caf_residence_non_conforme" ->
            Just Caf_residence_non_conforme

        "caf_ressources_trop_elevees" ->
            Just Caf_ressources_trop_elevees

        "caf_rsa_inferieur_seuil" ->
            Just Caf_rsa_inferieur_seuil

        "caf_surface_ponderee_sup" ->
            Just Caf_surface_ponderee_sup

        "caf_titre_sejour_absent" ->
            Just Caf_titre_sejour_absent

        "caf_titre_sejour_invalid" ->
            Just Caf_titre_sejour_invalid

        _ ->
            Nothing
