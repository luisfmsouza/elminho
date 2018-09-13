module Main exposing (main)

import Html exposing (program)
import Model exposing (Model)
import Update exposing (Msg, update)
import View exposing (view)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    program
        { init = ( { counter = 0, name = "Gato!", image = Nothing }, Cmd.none )
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
