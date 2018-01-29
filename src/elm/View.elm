module View exposing (global)

import Model exposing (Model)
import Message exposing (Message(..))
import Html.Attributes as Attr
import View.Header
import View.Footer
import View.ProjectSummary
import Html
    exposing
        ( Html
        , text
        , footer
        , main_
        , div
        )


global : Model -> Html Message
global model =
    div
        [ Attr.class "inner-app" ]
        [ View.Header.render model.project
        , main_
            []
            [ div [ Attr.class "packages-list" ] [ text "a" ]
            , View.ProjectSummary.render model.project
            ]
        , View.Footer.render model.errors
        ]
