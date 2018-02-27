module Main exposing (main)

import Html exposing (Html)
import Element exposing (Element, el, text, layout)
import Style exposing (style, styleSheet, StyleSheet)
import Color 
import Style.Color as ColorKey


main : Html msg
main =
    layout stylesheet helloElm


helloElm : Element Styles variation msg
helloElm = 
    el MainHeading [] (text "hello world!")

-- All styles logic here

type Styles = MainHeading

stylesheet : StyleSheet Styles variation
stylesheet = 
    styleSheet [
        style MainHeading [ColorKey.background Color.red]
    ]