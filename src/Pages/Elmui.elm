module Pages.Elmui exposing (..)

import Common exposing (ElmuiModel)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


initialModel : ElmuiModel
initialModel =
    0


createModel : String -> ElmuiModel
createModel val =
    let
        res =
            String.toInt val
    in
    case res of
        Just great ->
            great

        Nothing ->
            0


init : () -> ( ElmuiModel, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


view : ElmuiModel -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , text (String.fromInt model)
        , button [ onClick Increment ] [ text "+" ]
        ]


type Msg
    = Increment
    | Decrement
    | NoOp


update : Msg -> ElmuiModel -> ( ElmuiModel, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
