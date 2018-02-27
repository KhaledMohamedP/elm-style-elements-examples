module Main exposing (main)

import Color
import Element exposing (Element, button, el, image, layout, row, text)
import Element.Attributes exposing (center, fillPortion, height, padding, percent, px, spacing, verticalCenter, width)
import Html exposing (Html)
import Style exposing (StyleSheet, style, styleSheet)
import Style.Color as ColorKey


main : Html msg
main =
    layout stylesheet rowElm


rowElm : Element Styles variation msg
rowElm =
    row None
        [ spacing 5, padding 5, height (px 50) ]
        [ logo
        , slogan
        , login
        ]


logo : Element Styles variation msg
logo =
    image LogoStyle [ width (fillPortion 1), height (percent 100) ] { caption = "logo caption", src = "http://elm-lang.org/assets/logo.svg" }


slogan : Element Styles variation msg
slogan =
    row SloganStyle
        [ width (fillPortion 3), center ]
        [ el SloganStyle [ verticalCenter ] (text "Slogan here")
        ]


login : Element Styles variation msg
login =
    button LoginStyle [ width (fillPortion 1) ] (text "Login here")



-- All styles logic below


type Styles
    = None
    | LogoStyle
    | SloganStyle
    | LoginStyle


stylesheet : StyleSheet Styles variation
stylesheet =
    styleSheet
        [ style None []
        , style LogoStyle [ ColorKey.background Color.red ]
        , style SloganStyle [ ColorKey.background Color.blue ]
        , style LoginStyle [ ColorKey.background Color.green ]
        ]
