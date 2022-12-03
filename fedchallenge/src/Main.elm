module Main exposing (..)

import Browser
import Html exposing (Html)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    Element.layout  [width fill
                    , height fill
                    , Background.color <| rgb255 224 255 255
                    ]
     <| Element.column [width fill, Element.spacing 80] 
            [ row [width fill
                    , Element.centerX] 
                    [   row   [ width fill
                            , Border.rounded 20
                            , Background.color (rgb255 68 204 238)
                            , inFront <| el [Element.centerX, padding 50, Font.bold] <| (text " Frontend Developer Challenge " )
                            ]
                            [ image [ Border.rounded 30
                                    , padding 10 
                                    ]
                                                { src = "/logo.jpg"
                                                , description = "Talenteca"
                                                }
                            --, el [Element.centerX, Font.bold] <| (text " Frontend Developer Challenge " )]
                            ]
                    
                   
                    ]
                
            , el [Element.centerX] (text "Elm web page accessing a JSON API " )
            , row [
                  width fill, 
                  spacing 20, 
                  padding 20,
                  Background.color <| rgb255 64 224 208]
                  [text "here will go the row"]
            ]
{- <|
    el
        [ Background.color (rgb255 64 224 208)
        , Font.color (rgb255 255 255 255)
        , Border.rounded 10
        , padding 30
        ]
        (text "stylish!")
-}
---- PROGRAM ----

main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }