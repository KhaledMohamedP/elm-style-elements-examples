module Main exposing (main)

import Color
import Element exposing (Element, el, layout, row, text)
import Element.Attributes exposing (padding, spacing)
import Html exposing (Html)
import Style exposing (StyleSheet, style, styleSheet)
import Style.Color as ColorKey


main : Html msg
main =
    layout stylesheet rowElm


rowElm : Element Styles variation msg
rowElm =
    row None
        [ padding 5, spacing 5 ]
        [ helloElm
        , helloElm
        , helloElm
        ]


helloElm : Element Styles variation msg
helloElm =
    el MainHeading [] (text "hello world!")



-- All styles logic below


type Styles
    = None
    | MainHeading


stylesheet : StyleSheet Styles variation
stylesheet =
    styleSheet
        [ style MainHeading [ ColorKey.background Color.red ]
        , style None []
        ]
