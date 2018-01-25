module Struct exposing (Project, ProjectTitle)


type alias ProjectTitle =
    { path : String
    , isRTP : Bool
    }


type alias Project =
    { path : String
    , name : String
    , version : String
    , titlescreens : List ProjectTitle
    , scripts : List String
    }
