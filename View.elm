module View exposing (view)

-- import Html.Attributes exposing (style, value)
-- import Html.Events exposing (onClick, onInput)

import Color exposing (green, white)
import Element exposing (Element, column, el, image, layout, none, padding, spacing, text)
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)
import Model exposing (Model)
import Update exposing (Msg(Add, Dec, Inc, InputName, Reset))


greeting : Element Msg
greeting =
    el [ Font.color white ] (text "Olar, humano!")


form : String -> Element Msg
form name =
    let
        placeholder =
            Input.placeholder [] (text "Cachorro")

        label =
            Input.labelAbove []
                (el
                    [ Font.color white ]
                    (text "Qual é seu animal de estimacão favorito?")
                )
    in
    Input.text []
        { onChange = Just InputName
        , text = name
        , placeholder = Just placeholder
        , label = label
        }


dogImage : Maybe String -> Element Msg
dogImage maybeUrl =
    case maybeUrl of
        Just url ->
            el [] (image [] { src = url, description = "Au! Au!" })

        Nothing ->
            none


view : Model -> Html Msg
view { counter, name, image } =
    layout [ Background.color green ]
        (column [ spacing 10, padding 20 ]
            [ greeting
            , form name
            , dogImage image
            ]
        )
