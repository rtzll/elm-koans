module Koans11AboutTuples exposing (testSuite)

import Expect
import Utils.Blank exposing (..)
import Utils.Test exposing (describe, test)


testSuite =
    describe "About Tuples"
        [ test "tuples are like lists of fixed length" <|
            \() ->
                ( 1, 2 )
                    |> Expect.equal ( 1, 2 )
        , test "tuples may also be of mixed types" <|
            \() ->
                ( 1, "hey" )
                    |> Expect.equal ( 1, "hey" )
        , test "Tuple.pair creates a tuple" <|
            \() ->
                ( 1, "hey" )
                    |> Expect.equal (Tuple.pair 1 "hey")
        , test "first gets the first element of a 2-tuple" <|
            \() ->
                1
                    |> Expect.equal (Tuple.first ( 1, "hey" ))
        , test "second gets the second element of a 2-tuple" <|
            \() ->
                "hey"
                    |> Expect.equal (Tuple.second ( 1, "hey" ))
        , test "case statements may be used to destructure a tuple" <|
            \() ->
                case ( 1, 2 ) of
                    ( first, second ) ->
                        (first == 1 && second == 2)
                            |> Expect.true "Should be True"
        , test "tuples may also be destructured by function arguments" <|
            \() ->
                ( 1, 2 )
                    |> (\( f, s ) -> f == 1 && s == 2)
                    |> Expect.true "Should be True"
        ]
