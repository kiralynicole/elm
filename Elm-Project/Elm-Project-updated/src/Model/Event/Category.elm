module Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, allSelected, eventCategories, isEventCategorySelected, set, view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (checked, class, style, type_)
import Html.Events exposing (onCheck)


type EventCategory
    = Academic
    | Work
    | Project
    | Award


eventCategories =
    [ Academic, Work, Project, Award ]


{-| Type used to represent the state of the selected event categories
-}
type SelectedEventCategories
   -- = TODOCompleteThisType
   = EventCategory{academic:Bool, work:Bool, project:Bool, award:Bool}
   


{-| Returns an instance of `SelectedEventCategories` with all categories selected

    isEventCategorySelected Academic allSelected --> True

-}
allSelected : SelectedEventCategories
allSelected =
    -- TODOCompleteThisType
    --Debug.todo "Implement Model.Event.Category.allSelected"
    EventCategory{academic=True, work=True, project=True, award=True}

{-| Returns an instance of `SelectedEventCategories` with no categories selected

-- isEventCategorySelected Academic noneSelected --> False

-}
noneSelected : SelectedEventCategories
noneSelected =
    -- TODOCompleteThisType
    --Debug.todo "Implement Model.Event.Category.noneSelected"
    EventCategory{academic=False, work=False, project=False, award=False}

{-| Given a the current state and a `category` it returns whether the `category` is selected.

    isEventCategorySelected Academic allSelected --> True

-}
isEventCategorySelected : EventCategory -> SelectedEventCategories -> Bool
isEventCategorySelected category current =
    --False
   -- Debug.todo "Implement Model.Event.Category.isEventCategorySelected"
   case current of
        EventCategory ec ->
             case category of
                 Academic->ec.academic
                 Work->ec.work
                 Project->ec.project
                 Award->ec.award

{-| Given an `category`, a boolean `value` and the current state, it sets the given `category` in `current` to `value`.

    allSelected |> set Academic False |> isEventCategorySelected Academic --> False

    allSelected |> set Academic False |> isEventCategorySelected Work --> True

-}
set : EventCategory -> Bool -> SelectedEventCategories -> SelectedEventCategories
set category value current =
    -- current
   -- Debug.todo "Implement Model.Event.Category.set"
   case current of
        EventCategory ec ->
            case category of
                Academic->EventCategory{ec | academic = value}
                Work->EventCategory{ec | work = value}
                Project->EventCategory{ec | project = value}
                Award->EventCategory{ec | award = value}


checkbox : String -> Bool -> EventCategory -> Html ( EventCategory, Bool )
checkbox name state category =
    div [ style "display" "inline", class "category-checkbox" ]
        [ input [ type_ "checkbox", onCheck (\c -> ( category, c )), checked state ] []
        , text name
        ]


view : SelectedEventCategories -> Html ( EventCategory, Bool )
view model =
     div [] [
        checkbox "Academic event" (isEventCategorySelected Academic model) Academic , text ""
        ,checkbox "Work event" (isEventCategorySelected Work model) Work, text ""
        ,checkbox "Project event" (isEventCategorySelected Project model) Project, text""
        ,checkbox "Award event" (isEventCategorySelected Award model) Award,text ""
     ]
   -- Debug.todo "Implement the Model.Event.Category.view function"
