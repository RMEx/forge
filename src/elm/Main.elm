module Main exposing (..)

import Port exposing (Flags)
import Message exposing (Message(..))
import Model exposing (Model)
import View exposing (global)
import Html
import Action


subscriptions : Model -> Sub Message
subscriptions model =
    Sub.batch
        [ Port.sendProject SendProject
        , Port.selectedProject SelectedProject
        ]


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case message of
        SendProject effect ->
            Action.retreiveProject model effect

        SelectProject ->
            Action.selectProject model

        SelectedProject path ->
            Action.selectedProject model path

        OpenInExplorer ->
            Action.openInExplorer model


init : Flags -> ( Model, Cmd Message )
init flags =
    Model.fetchProject flags.path


main : Platform.Program Flags Model Message
main =
    Html.programWithFlags
        { init = init
        , update = update
        , view = global
        , subscriptions = subscriptions
        }
