module Main exposing (main)

import Color
import Element exposing (Element, below, button, column, el, image, layout, row, text)
import Element.Attributes exposing (center, fillPortion, height, padding, percent, px, spacing, verticalCenter, width)
import Element.Input as Input
import Html exposing (Html)
import Style exposing (StyleSheet, style, styleSheet)
import Style.Border as Border
import Style.Color as ColorKey


main : Html Msg
main =
    layout stylesheet headerBar


headerBar : Element Styles variation Msg
headerBar =
    row None
        [ spacing 5, padding 5, height (px 50) ]
        [ logo
        , slogan
        , login |> below [ loginDropdown ]
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


loginDropdown : Element Styles variation Msg
loginDropdown =
    column LoginDropdownStyle
        [ padding 5, spacing 5 ]
        [ userNameInput
        , passwordInput
        , loginOrRegister
        ]


userNameInput : Element Styles variation Msg
userNameInput =
    Input.text InputStyle
        []
        { onChange = UsernameChange
        , value = ""
        , label =
            Input.placeholder
                { label = Input.labelLeft (el None [ verticalCenter ] (text "Username: "))
                , text = "type a username"
                }
        , options = []
        }


passwordInput : Element Styles variation Msg
passwordInput =
    Input.newPassword InputStyle
        []
        { onChange = PasswordChange
        , value = ""
        , label =
            Input.placeholder
                { label = Input.labelLeft (el None [ verticalCenter ] (text "Password: "))
                , text = "******"
                }
        , options = []
        }


loginOrRegister : Element Styles variation msg
loginOrRegister =
    row None
        [ spacing 5 ]
        [ button None [ width (fillPortion 1) ] (text "Register")
        , button None [ width (fillPortion 2) ] (text "Login")
        ]


type Msg
    = UsernameChange String
    | PasswordChange String



-- All styles logic below


type Styles
    = None
    | LogoStyle
    | SloganStyle
    | LoginStyle
    | LoginDropdownStyle
    | InputStyle


stylesheet : StyleSheet Styles variation
stylesheet =
    styleSheet
        [ style None []
        , style LogoStyle [ ColorKey.background Color.red ]
        , style SloganStyle [ ColorKey.background Color.blue ]
        , style LoginStyle [ ColorKey.background Color.green ]
        , style LoginDropdownStyle [ ColorKey.background Color.grey ]
        , style InputStyle
            [ Border.rounded 2
            , Border.all 1
            ]
        ]
