module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { items : List String
    , newItem : String
    }


init : Model
init =
    Model [ "Test", "Test." ] ""



-- UPDATE


type Msg
    = Add
    | Remove
    | Type String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add ->
            if model.newItem /= "" then
                { model | items = model.newItem :: model.items, newItem = "" }

            else
                model

        Remove ->
            model

        Type typed ->
            { model | newItem = typed }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "type...", value model.newItem, onInput Type ] []
        , button [ onClick Add ] [ text "add" ]
        ]
        :: List.map outList model.items
        |> div []



-- UTILS


outList : String -> Html Msg
outList data =
    div []
        [ text data
        , button [ onClick Remove ] [ text "delete" ]
        ]
