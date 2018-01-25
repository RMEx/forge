module Action
    exposing
        ( retreiveProject
        , selectProject
        , selectedProject
        , openInExplorer
        )

import Model exposing (Model)
import Port exposing (Effect)
import Message exposing (Message(..))
import Struct
import RemoteData


pushError : Model -> String -> Model
pushError model message =
    { model
        | errors = (message :: model.errors)
        , project = RemoteData.Failure message
    }


pushProject : Model -> Struct.Project -> Model
pushProject model project =
    { model | project = RemoteData.Success project }


notAskedProject : Model -> Model
notAskedProject model =
    { model | project = RemoteData.NotAsked }


pendingProject : Model -> Model
pendingProject model =
    { model | project = RemoteData.Pending }


openInExplorer : Model -> ( Model, Cmd Message )
openInExplorer model =
    case model.project of
        RemoteData.Success project ->
            ( model, Port.openInExplorer project.path )

        _ ->
            ( model, Cmd.none )


retreiveProject : Model -> Effect Struct.Project -> ( Model, Cmd Message )
retreiveProject model effect =
    let
        newModel =
            if effect.ok then
                pushProject model effect.payload
            else
                pushError model effect.message
    in
        ( newModel, Cmd.none )


selectProject : Model -> ( Model, Cmd Message )
selectProject model =
    ( pendingProject model, Port.selectProject True )


selectedProject : Model -> Maybe String -> ( Model, Cmd Message )
selectedProject model potentialPath =
    case potentialPath of
        Just path ->
            ( pendingProject model, Port.fetchProject path )

        Nothing ->
            ( notAskedProject model, Cmd.none )
