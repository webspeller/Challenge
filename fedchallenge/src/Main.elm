module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (onClick)
import Element.Font as Font
import Element.Input as Input exposing (Label)
import Html exposing (Html)
import Html.Attributes as HA exposing (class, style)



---- MODEL ----


type alias Model =
    { toggle : Bool }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { toggle = False
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = Toggle
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Toggle ->
            ( { model | toggle = not model.toggle }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    Element.layout
        [ width fill
        , height fill
        , Background.color <| rgb255 224 255 255
        ]
    <|
        Element.column [ width fill, Element.spacing 10, padding 10 ]
            [ row
                [ width fill
                , Border.rounded 20
                , Background.color (rgb255 68 204 238)
                , inFront <| el [ Element.centerX, padding 30, Font.bold ] <| text " Frontend Developer Challenge "
                ]
                [ image
                    [ padding 20
                    ]
                    { src = "/logo.ico"
                    , description = "Talenteca"
                    }
                ]
            , el [ Element.centerX ] <| text "Elm web page accessing a JSON API "
            , column
                [ Element.centerX
                , Border.rounded 20
                , spacing 10
                , padding 10
                , Background.color (rgb255 32 178 170)
                ]
                [ el
                    [ Element.centerX
                    , alignTop
                    , padding 30
                    ]
                  <|
                    text "Toggle to change the search option"
                , row
                    [ width fill
                    , Border.rounded 20
                    , Background.color (rgb255 32 178 170)
                    , padding 20
                    , spacing 30
                    , alignTop
                    ]
                    [ el [ Element.alignLeft, padding 10 ] (text "Search by Country")
                    , el [ Element.centerX ] <|
                        Input.checkbox [ Element.centerX, Element.centerY, Element.alignTop, height shrink ] <|
                            { checked = model.toggle
                            , icon =
                                toggleCheckboxWidget
                                    { offColor = deepSkyBlue
                                    , onColor = green
                                    , sliderColor = white
                                    , toggleWidth = 60
                                    , toggleHeight = 28
                                    }
                            , label = Input.labelAbove [] <| text " "
                            , onChange = always Toggle
                            }
                    , el [ padding 10 ] (text "Search by Name and Phone")
                    ]
                ]
            ]



---- Definition of Colors ----


deepSkyBlue : Color
deepSkyBlue =
    rgb255 0 191 255


green : Color
green =
    rgb255 39 203 139


white : Color
white =
    rgb255 255 255 255



------- Definition of toggleCheckboxWidget which is called through View -----


toggleCheckboxWidget : { offColor : Color, onColor : Color, sliderColor : Color, toggleWidth : Int, toggleHeight : Int } -> Bool -> Element msg
toggleCheckboxWidget { offColor, onColor, sliderColor, toggleWidth, toggleHeight } checked =
    let
        pad =
            3

        sliderSize =
            toggleHeight - 2 * pad

        translation =
            (toggleWidth - sliderSize - pad)
                |> String.fromInt
    in
    el
        [ Background.color <|
            if checked then
                onColor

            else
                offColor
        , width <| px <| toggleWidth
        , height <| px <| toggleHeight
        , Border.rounded 14
        , inFront <|
            el [ height fill ] <|
                el
                    [ Background.color sliderColor
                    , Border.rounded <| sliderSize // 2
                    , width <| px <| sliderSize
                    , height <| px <| sliderSize
                    , centerY
                    , moveRight pad
                    , htmlAttribute <|
                        HA.style "transition" ".4s"
                    , htmlAttribute <|
                        if checked then
                            HA.style "transform" <| "translateX(" ++ translation ++ "px)"

                        else
                            HA.class ""
                    ]
                <|
                    text ""
        ]
    <|
        text ""



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , subscriptions = always Sub.none
        , update = update
        , view = view
        }
