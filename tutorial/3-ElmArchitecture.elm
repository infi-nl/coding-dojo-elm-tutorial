{-
   Main
   =========
       The logic of every Elm program will break up into three cleanly separated parts:

       Model — the state of your application
       Update — a way to update your state
       View — a way to view your state as HTML
-}


module Main exposing (..)

import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (onInput, onClick)
import Html.Attributes exposing (type', value)
import String exposing (..)


type alias Model =
    { counter : Int
    }


init : Model
init =
    { counter = 0
    }



{-
   Main
   =========

      All the main function does it take the essential parts of the elm architecture and turn them into a program,
      something you can either use a SPA or attach to an element in your view
-}
{- -}


main : Program Never
main =
    beginnerProgram { model = init, view = view, update = update }



{-
   View
   =========
       The view function returns Html that can produce messages of the type Msg
-}


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , div [] [ text (toString model.counter) ]
        , button [ onClick Increment ] [ text "+" ]
        , input [ type' "text", onInput OnInput, value <| toString model.counter ] []
        ]



{-
   type Msg
   =========
       The union Type Msg can contain more then one type of message, within the Elm architecture this type is commonly used as a way to communicate actions coming from the outside and to the outside world.
-}


type Msg
    = Increment
    | Decrement
    | OnInput String



{-
   Update
   =========
       The update function receives those messages and the current Model from the beginnerProgram in the main function and returns a new Model, it fires each time the view produces a new Msg.
-}


update : Msg -> Model -> Model
update msg model =
    let
        counter =
            model.counter
    in
        -- check the console in your browser and see the types of messages
        case Debug.log "the Msg is used to pattern match on the underlying types of the union type" msg of
            Increment ->
                { model | counter = counter + 1 }

            Decrement ->
                -- What happens here is that we return the new model, the `{ model | key = value }` syntax allows you to update copy it returns
                { model | counter = counter - 1 }

            -- try removing one of these branches and see what the compiler says
            OnInput input ->
                { model | counter = parseToInt input }


parseToInt : String -> Int
parseToInt input =
    Result.withDefault 0 (String.toInt input)
