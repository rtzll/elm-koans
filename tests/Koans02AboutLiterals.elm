module Koans02AboutLiterals exposing (testSuite)

import Expect
import Utils.Blank exposing (..)
import Utils.Test exposing (describe, test)


testSuite =
    describe "About Literals"
        [ test "strings are enclosed in double quotes" <|
            \() ->
                "A string"
                    |> Expect.equal "A string"
        , test "characters are enclosed in single quotes" <|
            \() ->
                'A'
                    |> Expect.equal 'A'
        , test "floats have a decimal" <|
            \() ->
                42.24
                    |> Expect.within (Expect.Absolute 0.0001) 42.24
        , test "integers do not" <|
            \() ->
                42
                    |> Expect.equal 42
        , test "number literals can be integers" <|
            let
                num : Int
                num =
                    42
            in
            \() ->
                42
                    |> Expect.equal num
        , test "number literals can be floats" <|
            let
                num : Float
                num =
                    42.0
            in
            \() ->
                42.0
                    |> Expect.within (Expect.Absolute 0.0001) num
        , test "floats can be expected to be within an absolute range" <|
            let
                num : Float
                num =
                    41.9999
            in
            \() ->
                42
                    |> Expect.within (Expect.Absolute 0.0001) num
        , test "or floats can be expected to be within relative range (0.01 meaning 1%)" <|
            let
                num : Float
                num =
                    41.6
            in
            \() ->
                41.6
                    |> Expect.within (Expect.Relative 0.01) num
        , test "lists are denoted by brackets" <|
            \() ->
                [ 1, 2, 3 ]
                    |> Expect.equal [ 1, 2, 3 ]
        ]
