module Rest exposing (DogsType, dogsRequest)

import Http exposing (Request, get)
import Json.Decode exposing (Decoder, string)
import Json.Decode.Pipeline exposing (decode, required)


type alias DogsType =
    { status : String, message : String }


dogsDecoder : Decoder DogsType
dogsDecoder =
    decode DogsType
        |> required "status" string
        |> required "message" string


dogsRequest : Request DogsType
dogsRequest =
    get "https://dog.ceo/api/breeds/image/random" dogsDecoder
