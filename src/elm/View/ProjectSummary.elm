module View.ProjectSummary exposing (render)

import RemoteData exposing (State(..))
import Message exposing (Message(..))
import Model exposing (ActiveProject)
import Html.Attributes as Attr
import Html.Events as Event
import Struct
import View.Util as Util
import Html
    exposing
        ( Html
        , text
        , div
        , p
        , h2
        , button
        , ul
        , li
        )


render : ActiveProject -> Html Message
render potentialProject =
    div
        [ Attr.class "project-details" ]
        (case potentialProject of
            Success project ->
                [ renderScriptList project.scripts
                , renderSummary project
                ]

            _ ->
                [ noProject ]
        )


renderScriptList : List String -> Html Message
renderScriptList stringList =
    div [ Attr.class "scripts-list" ]
        [ h2 [] [ text "Scripts" ]
        , ul [] (List.map renderScript stringList)
        ]


renderScript : String -> Html Message
renderScript script =
    let
        ( value, class ) =
            if String.isEmpty script then
                ( "_", "text-transparent" )
            else
                ( script, "" )
    in
        li [ Attr.class class ] [ text value ]


renderSummary : Struct.Project -> Html Message
renderSummary project =
    div
        []
        [ renderThumbnail project.titlescreens
        , renderEnumeration project.name project.version
        , renderButton project.path
        ]


renderThumbnail : List Struct.ProjectTitle -> Html Message
renderThumbnail titlescreens =
    div
        [ Attr.class "game-thumbnail" ]
        (Util.parallaxes titlescreens)


renderEnumeration : String -> String -> Html Message
renderEnumeration name version =
    Util.twoCell
        [ ( text "title", text name )
        , ( text "version", text version )
        ]
        [ "standard-enumeration" ]


renderButton : String -> Html Message
renderButton path =
    button
        [ Attr.class "full-button", Event.onClick OpenInExplorer ]
        [ text "open in explorer" ]


noProject : Html Message
noProject =
    div
        [ Attr.class "no-project" ]
        [ div []
            [ p
                []
                [ Util.iconCustom "exclamation-triangle" [ "fa-5x" ] []
                , text "No selected project"
                ]
            ]
        ]
