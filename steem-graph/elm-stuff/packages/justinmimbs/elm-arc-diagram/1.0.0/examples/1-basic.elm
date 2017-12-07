import AcyclicDigraph exposing (Node, Edge, Cycle, AcyclicDigraph)
import ArcDiagram
import Dict exposing (Dict)
import Html exposing (Html)
import Html.Attributes
import Set exposing (Set)


main : Program Never Model Node
main =
  Html.beginnerProgram
    { model =  (exampleEdges, exampleLabels)
    , update = always identity
    , view = view
    }


type alias Model =
  (Set Edge, Dict Node String)


view : Model -> Html Node
view (edges, labels) =
  let
    toLabel =
      (flip Dict.get) labels >> Maybe.withDefault ""

    graphView =
      case AcyclicDigraph.fromEdges edges of
        Err cycles ->
          viewCycles toLabel cycles

        Ok graph ->
          ArcDiagram.view
            ArcDiagram.defaultLayout
            (ArcDiagram.basicPaint toLabel)
            graph

  in
    Html.div
      [ Html.Attributes.style
          [ ("margin", "40px")
          , ("font-family", "Helvetica, Arial, san-serif")
          ]
      ]
      [ graphView
      ]


viewCycles : (Node -> String) -> List Cycle -> Html a
viewCycles toLabel cycles =
  Html.div
    []
    [ Html.text "Graph has the following cycles:"
    , Html.ol
        []
        (cycles |> List.map (viewCycle toLabel))
    ]


viewCycle : (Node -> String) -> Cycle -> Html a
viewCycle toLabel cycle =
  Html.li
    []
    [ Html.text (cycle |> List.map toLabel |> String.join " -> ") ]


-- example data

exampleEdges : Set Edge
exampleEdges =
  Set.fromList
    [ (2, 1)
    , (3, 1)
    , (3, 2)
    , (4, 2)
    , (5, 3)
    , (5, 4)
  --, (5, 9) -- make cycle
    , (6, 4)
    , (7, 4)
    , (8, 1)
    , (8, 3)
    , (8, 4)
    , (8, 6)
    , (9, 1)
    , (9, 3)
    , (9, 5)
    , (9, 6)
    ]


exampleLabels : Dict Node String
exampleLabels =
  Dict.fromList
    [ (1, "Alfa")
    , (2, "Bravo")
    , (3, "Charlie")
    , (4, "Delta")
    , (5, "Echo")
    , (6, "Foxtrot")
    , (7, "Golf")
    , (8, "Hotel")
    , (9, "India")
    ]
