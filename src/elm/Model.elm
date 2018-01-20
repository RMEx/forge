module Model exposing (Model, ActiveProject, fetchProject)

import Message exposing (Message(..))
import Port
import Struct
import RemoteData


type alias ActiveProject =
    RemoteData.State Struct.Project


type alias Model =
    { errors : List String
    , project : ActiveProject
    , packages : RemoteData.State (List String)
    }


fetchProject : Maybe String -> ( Model, Cmd Message )
fetchProject potentialPath =
    case potentialPath of
        Nothing ->
            ( init RemoteData.NotAsked, Cmd.none )

        Just path ->
            ( init RemoteData.Pending, Port.fetchProject path )


init : ActiveProject -> Model
init project =
    { errors = []
    , project = project
    , packages = RemoteData.NotAsked
    }
