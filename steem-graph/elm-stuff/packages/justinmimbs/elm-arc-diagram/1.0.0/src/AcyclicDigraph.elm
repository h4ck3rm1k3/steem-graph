module AcyclicDigraph exposing
  ( Node, Edge, Cycle, AcyclicDigraph
  , fromEdges
  , toEdges
  , topologicalRank
  , topologicalSortBy
  )

{-|
## Type aliases

The following type aliases are used to make type annotations more meaningful.

@docs Node, Edge, Cycle


## AcyclicDigraph

@docs AcyclicDigraph, fromEdges, toEdges


## Topological sorting

@docs topologicalRank, topologicalSortBy
-}

import Dict exposing (Dict)
import Digraph
import Set exposing (Set)


{-|
-}
type alias Node =
  Int


{-|
-}
type alias Edge =
  (Node, Node)


{-|
-}
type alias Cycle =
  List Node


{-| Represents a directed graph with no cycles.
-}
type AcyclicDigraph =
  AcyclicDigraph (Set Edge)


{-| From a directed graph represented as a set of edges, get an
`AcyclicDigraph` if the graph has no cycles; otherwise, get a list of all
its simple cycles.
-}
fromEdges : Set Edge -> Result (List Cycle) AcyclicDigraph
fromEdges edges =
  case Digraph.findCycles edges of
    [] ->
      Ok (AcyclicDigraph edges)
    cycles ->
      Err cycles


{-| From an `AcyclicDigraph`, get its representation as a set of edges.
-}
toEdges : AcyclicDigraph -> Set Edge
toEdges (AcyclicDigraph edges) =
  edges


{-| From a set of edges, get the set of nodes with no incoming edges.
-}
sourceNodes : Set Edge -> Set Node
sourceNodes edges =
  Set.diff
    (edges |> Set.map Tuple.first)
    (edges |> Set.map Tuple.second)


{-| Get a dictionary mapping node to topological rank. Rank numbering starts at
1 for all source nodes.
-}
topologicalRank : AcyclicDigraph -> Dict Node Int
topologicalRank (AcyclicDigraph edges) =
  let
    (remainingEdges, rankedNodes) =
      topologicalRankHelp
        1
        (sourceNodes edges)
        edges
        Dict.empty
  in
    if Set.isEmpty remainingEdges then
      rankedNodes
    else
      -- graph has cycles; remove this branch and always return rankedNodes?
      Dict.empty


topologicalRankHelp : Int -> Set Node -> Set Edge -> Dict Node Int -> (Set Edge, Dict Node Int)
topologicalRankHelp rank addNodes edges rankedNodes =
  if Set.isEmpty addNodes then
    (edges, rankedNodes)

  else
    let
      newRankedNodes =
        Set.foldl
          ((flip Dict.insert) rank)
          rankedNodes
          addNodes

      (removedEdges, remainingEdges) =
        Set.partition
          (Tuple.first >> (flip Set.member) addNodes)
          edges

      addNodesNext =
        Set.diff
          (removedEdges |> Set.map Tuple.second)
          (remainingEdges |> Set.map Tuple.second)

    in
      topologicalRankHelp
        (rank + 1)
        addNodesNext
        remainingEdges
        newRankedNodes


{-| From topologically-ranked nodes, get a well-ordered list of nodes by
providing a `(Node -> comparable)` function to sort same-ranked nodes by.
-}
topologicalSortBy : (Node -> comparable) -> Dict Node Int -> List Node
topologicalSortBy toComparable =
  invertDict
    >> Dict.values
    >> List.concatMap
        (Set.toList >> List.sortBy toComparable)


{-| Given a Dict x y, collect a Set x for each y. Assume the Dict represents a
surjective mapping.
-}
invertDict : Dict comparable comparable1 -> Dict comparable1 (Set comparable)
invertDict =
  Dict.foldl
    (\v k ->
        Dict.update
          k
          (Maybe.withDefault Set.empty >> Set.insert v >> Just)
    )
    Dict.empty
