-- https://github.com/justinmimbs/elm-arc-diagram/blob/master/examples/1-basic.elm
import AcyclicDigraph exposing (Node, Edge, Cycle, AcyclicDigraph)
import ArcDiagram
import Dict exposing (Dict)
import Html exposing (Html)
import Html.Attributes
import Set exposing (Set)

-- 
import Html as Html
import Html.Attributes as HA
import Sparkline exposing (Param(..), Point, sparkline)
import Sparkline.Extras exposing (Axes(..), extent)
import Svg as Svg
import Svg.Attributes as Svg

-- https://github.com/Kwarrtz/render/tree/2.0.0
import Graphics.Render exposing (ellipse, filledAndBordered, position, svg)
import Color exposing (rgb)

import GraphicSVG

--https://github.com/elm-community/typed-svg
import Html exposing (Html)
import Color
import TypedSvg exposing (svg, circle)
import TypedSvg.Attributes exposing (viewBox, cx, cy, r, fill, strokeWidth, stroke)
import TypedSvg.Types exposing (Fill(..), px)

import Dict exposing (Dict)
--import List.Extra
--import Random.Pcg exposing (..)
--import Fuzz exposing (Fuzzer)
import NetworkGraph

import Graph as G exposing (Graph, valid)
import Graph.Pair as GP
import Set
import Shrink exposing (Shrinker)
import Graph exposing (Edge, Graph, Node, NodeContext, NodeId)
import IntDict exposing (IntDict)

import Color
import TypedSvg exposing (svg, circle)
import TypedSvg.Attributes exposing (viewBox, cx, cy, r, fill, strokeWidth, stroke)
import TypedSvg.Types exposing (px)
import Element exposing (Element)

--- https://github.com/iosphere/elm-network-graph/blob/2.0.0/tests/Graph/GraphVizTests.elm
import Graph as Graph exposing (Graph)
import Graph.Edge exposing (Edge)
import Graph.Node as Node exposing (Node)
import Graph.GraphViz as GraphViz

-- elm-graphics https://github.com/elm-community/typed-svg/blob/2.0.0/src/Examples/Basic.elm
--import Native.Collage
import Text exposing (Text)
import Transform exposing (Transform)
