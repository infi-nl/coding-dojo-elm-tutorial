module Main exposing (..)

import Html exposing (..)


{-

   101
   =========

       add : Int -> Int -> Int
       This is a 'Type Annotation'.
       The above notation is telling us that the `add` function is taking two Int's and returning one Int.
       The type after the last `->` is telling us what is returned. Type Annotations are optional, Elm can infer the types you're passing into and returning from your functions

       The definition that goes with the type annotation for the `add` function is:

       add x y =

       You start with the function name and then seperate arguments by spaces. Our function is called `add` and takes `x` and `y`


-}


add : Int -> Int -> Int
add x y =
    x + y


times : Int -> Int -> Int
times x y =
    x * y



{-
   Partial Application:
   =========
       In Elm it's possible to pass a function only one of the arguments it needs.
       As you can see we only give the `add` function one of it's arguments.
       In exchange it then returns a function that takes the remaining arguments and returns the final result.
       This is reflected in the type annotation of add1
       Try changing the type annotation, to for example `add1: Int`
-}


add1 : Int -> Int
add1 =
    add 1


times5 : Int -> Int
times5 =
    times 5



{-
   Viewing the result in the browser
   =========

       The main function below is used to show the results of the example functions you might alter.
       You can find stuff about anonymous functions, partial application, composition and piping results down below.
-}


main : Html a
main =
    div []
        [ div []
            [ p [] [ text "Pipes are written as follows `<|` `|>` the pipes are used to pass results from one function to another." ]
            , text <| toString <| add 2 3
            , p [] [ text "This can be done both ways" ]
            , add 2 3 |> toString |> text
            , p [] [ text "Functions can be partially applied in Elm. See below." ]
            , add1 4 |> toString |> text
            , p [] [ text "Functions that take two arguments can be notated `infix` style" ]
            , 1 `times` 5 |> toString |> text
            , p [] [ text "This is how you write anonymous functions. You don't need to use pipes to pass through results, parentheses can be used to determain what is passed into what. It's all about personal preference." ]
            , 1 |> \x -> (x + 4) |> toString |> text
            , text (toString (((\x y -> (x + y)) 1) 4))
            , p [] [ text "Function composition, returns a new function. See below." ]
            , text (toString (addSomethingTimes5 1))
            , p [] [ text "The returned function can ofcourse be giving a value to get the desired result" ]
            , text (toString ((addSomethingTimes5 1) 4))
            ]
        ]



{-
   Extra: Function composition:
   =========
       It's also possible to use function composition to combine functions.
       Where pipes evaluate the functions, composition returns a new function.
-}


firstAdd1ThenTimes5 : Int -> Int
firstAdd1ThenTimes5 =
    add1 >> times5


firstTimes5ThenAdd1 : Int -> Int
firstTimes5ThenAdd1 =
    add1 << times5


addSomethingTimes5 : Int -> (Int -> Int)
addSomethingTimes5 x =
    add x >> times 5
