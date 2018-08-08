module Main exposing (..)

import Html exposing (Html, div, text, program)
import Navigation exposing (Location, program)

import Views.Header as Header exposing (..)
import Routes

-- モデル
type alias Model = 
    {
        page: Maybe Routes.Route,
        value: String
    }

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( 
        {
            page = Nothing
            , value = "test"
        }
        , Cmd.none 
    )

-- メッセージ
type Msg
    = NoOp
    | UrlChange Navigation.Location

-- ビュー
view : Model -> Html Msg
view { page, value } =
    div []
        [ 
            Header.header
            , text value
        ]

-- 更新
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
        UrlChange location ->
            ( model, Cmd.none )

-- サブスクリプション(購読)
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- MAIN
main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
