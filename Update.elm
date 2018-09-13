module Update exposing (Msg(..), update)

import Http exposing (Error, send)
import Model exposing (Model)
import Rest exposing (DogsType, dogsRequest)


type Msg
    = Inc
    | Dec
    | Reset
    | Add Int
    | InputName String
    | DogsResponse (Result Error DogsType)


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

        InputName "Gato" ->
            ( { model | counter = model.counter + 100, name = "Gato!" }, Cmd.none )

        InputName "Cachorro" ->
            ( { model | name = "Cachorro!" }, send DogsResponse dogsRequest )

        InputName name ->
            ( { model | name = name }, Cmd.none )

        DogsResponse (Ok response) ->
            ( { model | image = Just response.message }, Cmd.none )

        DogsResponse _ ->
            ( { model | image = Nothing }, Cmd.none )
