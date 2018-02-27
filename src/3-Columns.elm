module Main exposing (main)

import Html exposing (Html)
import Element exposing (Element, el, text, layout, column)
import Element.Attributes exposing (padding, spacing)
import Style exposing (style, styleSheet, StyleSheet)
import Color 
import Style.Color as ColorKey


main : Html msg
main =
    layout stylesheet columnElm

    
columnElm : Element Styles variation msg
columnElm = 
    column None [padding 5, spacing 5] [
        helloElm,
        helloElm,
        helloElm
        ]

helloElm : Element Styles variation msg
helloElm = 
    el MainHeading [] (text "hello world!")


-- All styles logic below

type Styles = None | MainHeading

stylesheet : StyleSheet Styles variation
stylesheet = 
    styleSheet [
        style MainHeading [ColorKey.background Color.red],
        style None []
    ]