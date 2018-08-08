module Main exposing (main)

import Html exposing (Html, button, div, input, p, program, span, text)
import Html.Attributes exposing (style, value)
import Html.Events exposing (onClick, onInput)


type alias Model =
    { counter : Int, name : String }


type Msg
    = Inc
    | Dec
    | Reset
    | Add Int
    | InputName String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Inc ->
            ( { model | counter = model.counter + 1 }, Cmd.none )

        Dec ->
            ( { model | counter = model.counter - 1 }, Cmd.none )

        Reset ->
            ( { model | counter = 0 }, Cmd.none )

        Add i ->
            ( { model | counter = model.counter + i }, Cmd.none )

        InputName "Souza" ->
            ( { counter = model.counter + 100, name = "Souza!" }, Cmd.none )

        InputName name ->
            ( { model | name = name }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


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


main : Program Never Model Msg
main =
    program
        { init = ( { counter = 0, name = "" }, Cmd.none )
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
