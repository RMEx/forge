port module Port
    exposing
        ( Flags
        , Effect
        , fetchProject
        , sendProject
        , selectProject
        , selectedProject
        )

import Struct


type alias Flags =
    { path : Maybe String }


type alias Effect a =
    { ok : Bool
    , message : String
    , payload : a
    }


port fetchProject : String -> Cmd msg


port sendProject : (Effect Struct.Project -> msg) -> Sub msg


port selectProject : Bool -> Cmd msg


port selectedProject : (Maybe String -> msg) -> Sub msg
