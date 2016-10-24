module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


{-
   101
   =========
       There are types. Examples of built-in types are: Bool, String, Int, Float and many more.
       In this document we're going to show you some ways to work with often used Types. And how you can create types or type aliases.

       This is how you would define the type Bool.

       type Bool = False | True

       We can define a type like Bool that has a third option, Grayish, and a type Color
-}


type MyBool
    = Falseish
    | Trueish
    | Grayish


type Color
    = Red
    | Green
    | Gray



{-

   Pattern Matching
   =========
   Falseish, Trueish and Grayish are called constructors of type MyBool, like False and True are constructors of type Bool.

   Types are defined by their constructors.

   You can use these constructors to pattern match an argument of a function.

   The functions below use the above defined types by pattern matching the constructors.

-}


boolToColor : MyBool -> Color
boolToColor bool =
    case bool of
        Falseish ->
            Red

        Trueish ->
            Green

        Grayish ->
            Gray


color : Color -> String
color x =
    case x of
        Red ->
            "red"

        Green ->
            "green"

        Gray ->
            "gray"



{-
   Types with arguments
   =========

       Types can have arguments, in fact most types do. An example of a frequently used type with an argument is the Maybe type which is defined as follows:

       type Maybe a =
           Just a | Nothing

       The Maybe type has 2 constructors: Just and Nothing on which you can pattern match like we did with MyBool and Color.
       The point of the Maybe type is that you can express a null value, or uncertainty.
       You could imagine a function that decodes a json string to a type with optional fields. A good way to allow for these optional fields is to
       wrap them into the Maybe type, so that if the field does not exist in the Json string, it can be expressed by Nothing.

       The 'a' argument is a generic argument that can be inferred to any type.
       For example, Just 5 is of type Maybe Int, and Just True is of type Maybe Bool, and Just Grayish is of type Maybe MyBool.

       We can create our own types with arguments.
       Note that Person has a Constructor that is also called Person.

-}


type Person
    = Person String String Int



{-
   Type alias
   =========

       Type aliases are just synonyms of existing types.
       Meaning that you can replace any alias for the type it is an alias of.
       You create these for your own convenience.
-}


type alias FirstName =
    String


type alias LastName =
    String


type alias Age =
    Int



-- Now you can create a Person type in a readable way:


type MyPerson
    = MyPerson FirstName LastName Age



--  using a `case p of` statement you can pattern match on the types


getFullName : MyPerson -> String
getFullName p =
    case p of
        MyPerson first last age ->
            first ++ last



{-
   Records
   =========

       A record is a set of key-value pairs, similar to objects in JavaScript or Python. You will find that they are extremely common and useful in Elm.
-}


type alias PersonRecord =
    { firstName : FirstName
    , lastName : LastName
    , age : Age
    }


createPerson : FirstName -> LastName -> Age -> PersonRecord
createPerson firstName lastName age =
    PersonRecord firstName lastName age



-- records can also be written without first specifying them as an alias,
-- as you can see in the type annotation the record is identified by the keys and values it contains.


foobarRecordFunction : { foo : String, bar : String }
foobarRecordFunction =
    { foo = "bar", bar = "foo" }


sayName : PersonRecord -> String
sayName { firstName, lastName, age } =
    firstName ++ lastName



{-

   Viewing the result in the browser
   =========

   The main function below is used to show the results of the example functions you might alter.
   See what you can break or change.

-}


main : Html a
main =
    div []
        [ div []
            [ p [ style [ ( "backgroundColor", color Red ) ] ] [ text "Our Colored Paragraph" ]
            , p [ style [ ( "backgroundColor", color <| boolToColor Grayish ) ] ] [ text "MyBool Paragraph" ]
            ]
        ]
