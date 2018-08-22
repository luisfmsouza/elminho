module View exposing (view)

-- import Html.Attributes exposing (style, value)
-- import Html.Events exposing (onClick, onInput)

import Color exposing (green, white)
import Element exposing (Element, column, el, layout, padding, spacing, text)
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)
import Model exposing (Model)
import Update exposing (Msg(Add, Dec, Inc, InputName, Reset))


greeting : String -> Element Msg
greeting name =
    el [ Font.color white ] (text (".olar, " ++ name ++ "!"))


form : String -> Element Msg
form name =
    let
        placeholder =
            Input.placeholder [] (text "Digite seu nome")

        label =
            Input.labelAbove []
                (el
                    [ Font.color white ]
                    (text "Qual é o seu nome?")
                )
    in
    Input.text []
        { onChange = Just InputName
        , text = name
        , placeholder = Just placeholder
        , label = label
        }


view : Model -> Html Msg
view { counter, name } =
    layout [ Background.color green ]
        (column [ spacing 10, padding 20 ]
            [ greeting name
            , form name
            ]
        )



-- view2 : Model -> Html Msg
-- view2 { counter, name } =
--     let
--         divStyle =
--             [ ( "backgroundColor", "green" ), ( "padding", "20px" ) ]
--         textStyle =
--             [ ( "color", "white" ) ]
--         buttonStyle =
--             [ ( "backgroundColor", "lime" ), ( "margin", "10px" ) ]
--         buttonResetStyle =
--             [ ( "backgroundColor", "fuchsia" ), ( "margin", "10px" ), ( "color", "white" ) ]
--     in
--     div
--         [ style divStyle ]
--         [ p
--             [ style textStyle ]
--             [ text ("Olar " ++ name ++ "!") ]
--         , p [ style textStyle ] [ text "Qual é seu nome?" ]
--         , input [ value name, onInput InputName ] []
--         , p [ style textStyle ] [ text "Mostre que você sabe somar:" ]
--         , p [ style textStyle ]
--             [ text (toString counter) ]
--         , button [ style buttonStyle, onClick Inc ] [ text "+ Increase" ]
--         , button [ style buttonStyle, onClick Dec ] [ text "- Decrease" ]
--         , button [ style buttonStyle, onClick (Add 10) ] [ text "Add 10" ]
--         , button [ style buttonResetStyle, onClick Reset ] [ text "Reset" ]
--         ]
