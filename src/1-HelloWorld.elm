module Main exposing (main)

import Html exposing (Html)
import Element exposing (layout, el, text, Element)
import Style exposing (Style, StyleSheet)

main : Html msg
main =
    layout stylesheet helloElm

helloElm : Element Styles variation msg      
helloElm = 
    el None [] (text "hello world!")

stylesheet : StyleSheet Styles variation
stylesheet = 
    Style.styleSheet []

type Styles = None