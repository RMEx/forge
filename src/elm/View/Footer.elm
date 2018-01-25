module View.Footer exposing (render)

import Message exposing (Message(..))
import View.Util
import Html
    exposing
        ( Html
        , text
        , footer
        , span
        )


render : List String -> Html Message
render activeProject =
    footer
        []
        [ View.Util.icon "exclamation-triangle"
        , span [] [ text "0 errors" ]
        ]
