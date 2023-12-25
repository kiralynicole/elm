module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id)
import Html.Attributes exposing (href)



type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
    div[][
        h1[id "name"][text details.name],
        em[id "intro"][text details.intro],
        ul[] (details.contacts |> List.map (\contact -> li[class "contact-detail"][text (contact.name ++ ": " ++ contact.detail)])),
        ul[]( details.socials |> List.map (\social -> li[class "social-link"][a[href social.detail][text social.name]]))
    ]

   -- Debug.todo "Implement the Model.PersonalDetails.view function"


        
