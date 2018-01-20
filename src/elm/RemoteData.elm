module RemoteData
    exposing
        ( State(..)
        , fromMaybe
        )


type State object
    = NotAsked
    | Pending
    | Success object
    | Failure String


fromMaybe : Maybe object -> State object
fromMaybe potentialObject =
    case potentialObject of
        Nothing ->
            NotAsked

        Just object ->
            Success object
