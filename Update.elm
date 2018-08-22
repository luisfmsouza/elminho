module Update exposing (Msg(..), update)

import Model exposing (Model)


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
