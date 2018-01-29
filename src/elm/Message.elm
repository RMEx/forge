module Message exposing (Message(..))

import Port exposing (Effect)
import Struct


type Message
    = SendProject (Effect Struct.Project)
    | SelectProject
    | SelectedProject (Maybe String)
    | OpenInExplorer
