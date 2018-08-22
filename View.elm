module View exposing (view)

import Html exposing (Html, button, div, input, p, span, text)
import Html.Attributes exposing (style, value)
import Html.Events exposing (onClick, onInput)
import Model exposing (Model)
import Update exposing (Msg(Add, Dec, Inc, InputName, Reset))


view : Model -> Html Msg
view { counter, name } =
    let
        divStyle =
            [ ( "backgroundColor", "green" ), ( "padding", "20px" ) ]

        textStyle =
            [ ( "color", "white" ) ]

        buttonStyle =
            [ ( "backgroundColor", "lime" ), ( "margin", "10px" ) ]

        buttonResetStyle =
            [ ( "backgroundColor", "fuchsia" ), ( "margin", "10px" ), ( "color", "white" ) ]
    in
    div
        [ style divStyle ]
        [ p
            [ style textStyle ]
            [ text ("Olar " ++ name ++ "!") ]
        , p [ style textStyle ] [ text "Qual é seu nome?" ]
        , input [ value name, onInput InputName ] []
        , p [ style textStyle ] [ text "Mostre que você sabe somar:" ]
        , p [ style textStyle ]
            [ text (toString counter) ]
        , button [ style buttonStyle, onClick Inc ] [ text "+ Increase" ]
        , button [ style buttonStyle, onClick Dec ] [ text "- Decrease" ]
        , button [ style buttonStyle, onClick (Add 10) ] [ text "Add 10" ]
        , button [ style buttonResetStyle, onClick Reset ] [ text "Reset" ]
        ]
