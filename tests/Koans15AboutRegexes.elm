module Koans15AboutRegexes exposing (testSuite)

import Expect
import Regex
import String
import Utils.Blank exposing (..)
import Utils.Test exposing (describe, test)


{-| Returns a parsed Regex.Regex for a string. If the string cannot be parsed, a
Regex.never shall be returned (never matches any input).
-}
myRegex : String -> Regex.Regex
myRegex expression =
    Regex.fromString expression |> Maybe.withDefault Regex.never


{-| Returns a parsed Regex.Regex for a string with options. If the string cannot
be parsed, a Regex.never shall be returned (never matches any input).
-}
myRegexWith : Regex.Options -> String -> Regex.Regex
myRegexWith options expression =
    Regex.fromStringWith options expression |> Maybe.withDefault Regex.never


testSuite =
    describe "About Regex"
        [ test "contains tests for a regex match" <|
            \() ->
                True
                    |> Expect.equal (Regex.contains (myRegex "[abc]+") "abcdefg")
        , test "Regex.never shall never match anything" <|
            \() ->
                False
                    |> Expect.equal (Regex.contains Regex.never "anything")
        , test "you need to escape manually special characters" <|
            \() ->
                True
                    |> Expect.equal (Regex.contains (myRegex "\\[abc\\]\\+") "hello[abc]+elm")
        , test "it's easy to make your regex case insensitive" <|
            \() ->
                True
                    |> Expect.equal (Regex.contains (myRegexWith { caseInsensitive = True, multiline = False } "[abc]+") "ABC")
        , test "find returns a list of all matches" <|
            \() ->
                3
                    |> Expect.equal (Regex.find (myRegex "abc") "abcabcabc" |> List.length)
        , test "matches contain the match" <|
            \() ->
                [ "a", "b", "c" ]
                    |> Expect.equal (Regex.find (myRegex "[abc]") "axbxc" |> List.map (\match -> match.match))
        , test "matches contain the index" <|
            \() ->
                [ 0, 2, 4 ]
                    |> Expect.equal (Regex.find (myRegex "[abc]") "axbxc" |> List.map (\match -> match.index))
        , test "matches may contain submatches" <|
            \() ->
                [ [ Just "a", Nothing ], [ Nothing, Just "b" ] ]
                    |> Expect.equal (Regex.find (myRegex "(a)|(b)") "axbxc" |> List.map (\match -> match.submatches))
        , test "findAtMost limits the number of matches" <|
            \() ->
                [ "a", "b" ]
                    |> Expect.equal (Regex.findAtMost 2 (myRegex "[abc]") "axbxc" |> List.map (\match -> match.match))
        , test "replace can modify based on the match" <|
            \() ->
                "AxBxC"
                    |> Expect.equal (Regex.replace (myRegex "[abc]") (\match -> String.toUpper match.match) "axbxc")
        ]
