module View.Header exposing (render)

import RemoteData exposing (State(..))
import Message exposing (Message(..))
import Model exposing (ActiveProject)
import Html.Events as Event
import Html.Attributes as Attr
import View.Util as Util
import Html
    exposing
        ( Html
        , text
        , header
        , button
        , span
        , div
        , h1
        )


render : ActiveProject -> Html Message
render project =
    header
        []
        [ topBar project
        , projectBar project
        ]


selector : ActiveProject -> List (Html Message)
selector project =
    case project of
        Pending ->
            [ Util.iconCustom "spinner" [ "fa-spin" ] [] ]

        Success _ ->
            changeBtn "change project"

        _ ->
            changeBtn "chose project"


changeBtn : String -> List (Html Message)
changeBtn key =
    [ button
        [ Attr.class "std-button", Event.onClick SelectProject ]
        [ text key ]
    ]


topBar : ActiveProject -> Html Message
topBar project =
    div
        [ Attr.class "top-bar" ]
        [ h1 [ Attr.class "logo" ] [ text "forge" ]
        , div
            []
            (selector project)
        ]


projectBarContent : ActiveProject -> List (Html Message)
projectBarContent activeProject =
    case activeProject of
        Success project ->
            [ span [ Attr.class "project-path" ] [ text project.path ] ]

        _ ->
            [ span [ Attr.class "no-project" ] [ text "no current project" ] ]


projectBar : ActiveProject -> Html Message
projectBar project =
    div
        [ Attr.class "active-project-bar" ]
        (projectBarContent project)
