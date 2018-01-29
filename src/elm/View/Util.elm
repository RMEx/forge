module View.Util exposing (fa, icon, iconCustom, twoCell, parallaxes)

{-| Provide some useful function to write the components
-}

import Html
    exposing
        ( Html
        , Attribute
        , i
        , ul
        , li
        , div
        , img
        )
import Html.Attributes as Attr


{-| Create a list of attributes to promote a node to an FontAwesome Icon
-}
fa : String -> List String -> List (Attribute msg)
fa icon otherClasses =
    let
        classes =
            [ "fa", "fa-" ++ icon ]
                ++ otherClasses
                |> String.join " "
    in
        [ Attr.class classes
        , Attr.attribute "aria-hidden" "true"
        ]


{-| Create a FontAwesome Icon
-}
icon : String -> Html msg
icon identifier =
    iconCustom identifier [] []


{-| Create a FontAwesome Icon paramterizable
-}
iconCustom : String -> List String -> List (Attribute msg) -> Html msg
iconCustom identifier classes attributes =
    i ((fa identifier classes) ++ attributes) []


{-| Generate a two cell list
-}
twoCell : List ( Html msg, Html msg ) -> List String -> Html msg
twoCell list classes =
    ul
        [ Attr.class (String.join " " ("two-cell" :: classes)) ]
        (List.map
            (\( x, y ) ->
                li [] [ div [] [ x ], div [] [ y ] ]
            )
            list
        )


{-| Generate a multiparallaxes div
-}
parallaxes : List { path : String, isRTP : Bool } -> List (Html msg)
parallaxes =
    List.map parallaxesAux


parallaxesAux : { path : String, isRTP : Bool } -> Html msg
parallaxesAux background =
    img [ Attr.src (resolveBackground background) ] []


resolveBackground : { path : String, isRTP : Bool } -> String
resolveBackground record =
    if record.isRTP then
        "assets/rtp/" ++ record.path
    else
        record.path
