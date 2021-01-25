module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type alias Model =
    { count : Maybe Int }


initialModel : Model
initialModel =
    { count = Nothing }


type Msg
    = Increment
    | Decrement

increment : Int -> Int
increment x = x + 1

decrement  : Int -> Int
decrement x = x - 1

mIncrement : Maybe Int -> Int
mIncrement mInt =
    case mInt of
        Nothing ->
            1
        Just x ->
            increment x

mDecrement : Maybe Int -> Int
mDecrement mInt =
    mInt
        |> Maybe.withDefault 0
        |> decrement

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count |> mIncrement |> Just }

        Decrement ->
            { model | count = model.count |> mDecrement |> Just}


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Increment ] [ text "+1" ]
        , div [] [ text <| String.fromInt <| Maybe.withDefault 0 <| model.count ]
        , button [ onClick Decrement ] [ text "-1" ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }

