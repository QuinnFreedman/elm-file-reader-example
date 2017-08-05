module Main exposing (..)

import FileReader exposing (NativeFile, onFileChange)
import Html exposing (Html, code, div, hr, input, text)
import Html.Attributes exposing (type_)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = init
        , update = update
        , view = view
        }


type alias Model =
    { file : Maybe NativeFile
    }


init : Model
init =
    { file = Nothing
    }


type Msg
    = FileSelected (Maybe NativeFile)


update : Msg -> Model -> Model
update msg model =
    case msg of
        FileSelected file ->
            { model | file = file }


view : Model -> Html Msg
view model =
    div []
        [ input
            [ type_ "file"
            , onFileChange (List.head >> FileSelected)
            ]
            []
        , hr [] []
        , code []
            [ text (toString model)
            ]
        ]
