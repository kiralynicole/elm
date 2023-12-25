module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Html.Attributes exposing (href)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


compareIntervals:Interval->Interval->Order
compareIntervals i1 i2 = 
    Interval.compare i1 i2
    
sortByInterval : List Event -> List Event
sortByInterval events =
     --events
     List.sortWith (\ev1 ev2 -> compareIntervals ev1.interval ev2.interval) <| events
   -- Debug.todo "Implement Event.sortByInterval"


view : Event -> Html Never
view event =
  --  div[][]
  let 
    importantClass = 
        if event.important then
            " event-important"
        else 
            ""  
    url = (event.url |> Maybe.withDefault "")          
  in
    div[class ("event" ++ importantClass)][
          h2[class "event-title"][text event.title]
         ,p[class "event-description"][ event.description]
         ,p[class "event-category"][categoryView event.category]
         ,p[class "event-interval"][Interval.view event.interval] 
         ,p[class "event-url"][text url]
        ]
    
  --  Debug.todo "Implement the Model.Event.view function"
