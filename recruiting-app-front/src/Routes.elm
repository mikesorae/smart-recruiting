module Routes exposing (..)

import Navigation exposing (Location)
import UrlParser as Url exposing ((</>), Parser, oneOf, parseHash, s, string, top)


type Route
    = Home
    | JobList
    | JobDetail
    | NotFound

route : Parser (Route -> a) a
route =
    oneOf
        [ Url.map Home top
        , Url.map JobList (s "jobs")
        ]

parseLocation : Location -> Route
parseLocation location =
    case (Url.parseHash route location) of
        Just route ->
            route

        Nothing ->
            NotFound