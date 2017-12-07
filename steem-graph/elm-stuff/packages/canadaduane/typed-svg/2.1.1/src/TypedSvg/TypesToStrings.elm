module TypedSvg.TypesToStrings exposing (..)

{-|
# Converts each type from TypedSvg.Types to its corresponding string
@docs accumulateToString, additiveToString, alignToString,
    alignmentBaselineToString, anchorAlignmentToString,
    animateTransformTypeToString, attributeTypeToString,
    baselineShiftToString, bezierAnchorPointToString, boolToString,
    calcModeToString, clipPathToString, clipRuleToString, clipToString,
    cm, colorInterpolationToString, colorMatrixTypeToString,
    colorProfileToString, compositeOperatorToString, coordinateSystemToString,
    cursorToString, directionToString, displayToString,
    dominantBaselineToString, durationToString, edgeModeToString, em, ex,
    fillRuleToString, filterToString, floodColorToString,
    fontSizeAdjustToString, fontStretchToString, fontStyleToString,
    fontVariantToString, fontWeightToString, funcTypeToString, inValueToString,
    inch, kerningToString, lengthAdjustToString, lengthToString,
    markerCoordinateSystemToString, meetOrSliceToString, mm, modeToString,
    morphologyOperatorToString, num, opacityToString, pc, percent, pt, px,
    renderingToString, repeatCountToString, restartToString, scaleToString,
    shapeRenderingToString, timingValueAsString, transformToString,
    turbulenceTypeToString, yesNoToString
-}

import Color.Convert exposing (colorToCssRgba)
import TypedSvg.Types exposing (..)


boolToString : Bool -> String
boolToString bool =
    case bool of
        True ->
            "true"

        False ->
            "false"


accumulateToString : Accumulate -> String
accumulateToString accumulate =
    case accumulate of
        AccumulateNone ->
            "none"

        AccumulateSum ->
            "sum"


additiveToString : Additive -> String
additiveToString additive =
    case additive of
        AdditiveNone ->
            "none"

        AdditiveReplace ->
            "replace"


alignToString : Align -> String
alignToString align =
    case align of
        AlignNone ->
            "none"

        Align x y ->
            "x" ++ (scaleToString x) ++ "y" ++ (scaleToString y)


alignmentBaselineToString : AlignmentBaseline -> String
alignmentBaselineToString alignmentBaseline =
    case alignmentBaseline of
        AlignmentAuto ->
            "auto"

        AlignmentBaseline ->
            "baseline"

        AlignmentBeforeEdge ->
            "before-edge"

        AlignmentTextBeforeEdge ->
            "text-before-edge"

        AlignmentMiddle ->
            "middle"

        AlignmentCentral ->
            "central"

        AlignmentAfterEdge ->
            "after-edge"

        AlignmentTextAfterEdge ->
            "text-after-edge"

        AlignmentIdeographic ->
            "ideographic"

        AlignmentAlphabetic ->
            "alphabetic"

        AlignmentHanging ->
            "hanging"

        AlignmentMathematical ->
            "mathematical"

        AlignmentInherit ->
            "inherit"


anchorAlignmentToString : AnchorAlignment -> String
anchorAlignmentToString anchorAlignment =
    case anchorAlignment of
        AnchorInherit ->
            "inherit"

        AnchorStart ->
            "start"

        AnchorMiddle ->
            "middle"

        AnchorEnd ->
            "end"


animateTransformTypeToString : AnimateTransformType -> String
animateTransformTypeToString animateTransformType =
    case animateTransformType of
        AnimateTransformTypeTranslate ->
            "translate"

        AnimateTransformTypeScale ->
            "scale"

        AnimateTransformTypeRotate ->
            "rotate"

        AnimateTransformTypeSkewX ->
            "skewX"

        AnimateTransformTypeSkewY ->
            "skewY"


attributeTypeToString : AttributeType -> String
attributeTypeToString attributeType =
    case attributeType of
        AttributeTypeAuto ->
            "auto"

        AttributeTypeCss ->
            "CSS"

        AttributeTypeXml ->
            "XML"


baselineShiftToString : BaselineShift -> String
baselineShiftToString baselineShift =
    case baselineShift of
        ShiftAuto ->
            "auto"

        ShiftBaseline ->
            "baseline"

        ShiftSuper ->
            "super"

        ShiftSub ->
            "sub"

        ShiftPercentage value ->
            (toString value) ++ "%"

        ShiftLength length ->
            (lengthToString length)

        ShiftInherit ->
            "inherit"


bezierAnchorPointToString : ( number, number, number, number ) -> String
bezierAnchorPointToString ( x1, y1, x2, y2 ) =
    List.map toString [ x1, y1, x2, y2 ] |> String.join " "


calcModeToString : CalcMode -> String
calcModeToString calcMode =
    case calcMode of
        CalcModeDiscrete ->
            "discrete"

        CalcModeLinear ->
            "linear"

        CalcModePaced ->
            "paced"

        CalcModeSpline ->
            "spline"


clipToString : Clip -> String
clipToString clip =
    case clip of
        ClipAuto ->
            "auto"

        ClipInherit ->
            "inherit"

        ClipShape top right bottom left ->
            "rect("
                ++ (toString top)
                ++ " "
                ++ (toString right)
                ++ " "
                ++ (toString bottom)
                ++ " "
                ++ (toString left)
                ++ ")"


clipPathToString : ClipPath -> String
clipPathToString clipPath =
    case clipPath of
        ClipPathNone ->
            "none"

        ClipPathInherit ->
            "inherit"

        ClipPathFunc value ->
            value


clipRuleToString : ClipRule -> String
clipRuleToString clipRule =
    case clipRule of
        ClipRuleNonZero ->
            "nonzero"

        ClipRuleEvenOdd ->
            "evenodd"

        ClipRuleInherit ->
            "inherit"


colorInterpolationToString : ColorInterpolation -> String
colorInterpolationToString colorInterpolation =
    case colorInterpolation of
        ColorInterpolationAuto ->
            "auto"

        ColorInterpolationSRGB ->
            "sRGB"

        ColorInterpolationLinearRGB ->
            "linearRGB"

        ColorInterpolationInherit ->
            "inherit"


colorMatrixTypeToString : ColorMatrixType -> String
colorMatrixTypeToString colorMatrixType =
    case colorMatrixType of
        ColorMatrixTypeMatrix ->
            "matrix"

        ColorMatrixTypeSaturate ->
            "saturate"

        ColorMatrixTypeHueRotate ->
            "hueRotate"

        ColorMatrixTypeLuminanceToAlpha ->
            "luminanceToAlpha"


colorProfileToString : ColorProfile -> String
colorProfileToString colorProfile =
    case colorProfile of
        ColorProfileAuto ->
            "auto"

        ColorProfileSRGB ->
            "sRGB"

        ColorProfile name ->
            name

        ColorProfileInherit ->
            "inherit"


compositeOperatorToString : CompositeOperator -> String
compositeOperatorToString compositeOperator =
    case compositeOperator of
        CompositeOperatorOver ->
            "over"

        CompositeOperatorIn ->
            "in"

        CompositeOperatorOut ->
            "out"

        CompositeOperatorAtop ->
            "atop"

        CompositeOperatorXor ->
            "xor"

        CompositeOperatorArithmetic ->
            "arithmetic"


{-| CoordinateSystem is used by filter and clip
-}
coordinateSystemToString : CoordinateSystem -> String
coordinateSystemToString coordinateSystem =
    case coordinateSystem of
        CoordinateSystemUserSpaceOnUse ->
            "userSpaceOnUse"

        CoordinateSystemObjectBoundingBox ->
            "objectBoundingBox"


cursorToString : Cursor -> String
cursorToString cursor =
    case cursor of
        CursorAuto ->
            "auto"

        CursorDefault ->
            "default"

        CursorCrosshair ->
            "crosshair"

        CursorPointer ->
            "pointer"

        CursorMove ->
            "move"

        CursorEResize ->
            "e-resize"

        CursorNEResize ->
            "ne-resize"

        CursorNWResize ->
            "nw-resize"

        CursorNResize ->
            "n-resize"

        CursorSEResize ->
            "se-resize"

        CursorSWResize ->
            "sw-resize"

        CursorWResize ->
            "w-resize"

        CursorText ->
            "text"

        CursorWait ->
            "wait"

        CursorHelp ->
            "help"

        CursorInherit ->
            "inherit"

        Cursor funcIRI ->
            funcIRI


directionToString : Direction -> String
directionToString direction =
    case direction of
        DirectionLTR ->
            "ltr"

        DirectionRTL ->
            "rtl"

        DirectionInherit ->
            "inherit"


displayToString : Display -> String
displayToString display =
    case display of
        DisplayInline ->
            "inline"

        DisplayBlock ->
            "block"

        DisplayListItem ->
            "list-item"

        DisplayRunIn ->
            "run-in"

        DisplayCompact ->
            "compact"

        DisplayMarker ->
            "marker"

        DisplayTable ->
            "table"

        DisplayInlineTable ->
            "inline-table"

        DisplayTableRowGroup ->
            "table-row-group"

        DisplayTableHeaderGroup ->
            "table-header-group"

        DisplayTableFooterGroup ->
            "table-footer-group"

        DisplayTableRow ->
            "table-row"

        DisplayTableColumnGroup ->
            "table-column-group"

        DisplayTableColumn ->
            "table-column"

        DisplayTableCell ->
            "table-cell"

        DisplayTableCaption ->
            "table-caption"

        DisplayNone ->
            "none"

        DisplayInherit ->
            "inherit"


dominantBaselineToString : DominantBaseline -> String
dominantBaselineToString dominantBaseline =
    case dominantBaseline of
        DominantBaselineAuto ->
            "auto"

        DominantBaselineUseScript ->
            "use-script"

        DominantBaselineNoChange ->
            "no-change"

        DominantBaselineResetSize ->
            "reset-size"

        DominantBaselineIdeographic ->
            "ideographic"

        DominantBaselineAlphabetic ->
            "alphabetic"

        DominantBaselineHanging ->
            "hanging"

        DominantBaselineMathematical ->
            "mathematical"

        DominantBaselineCentral ->
            "central"

        DominantBaselineMiddle ->
            "middle"

        DominantBaselineTextAfterEdge ->
            "text-after-edge"

        DominantBaselineTextBeforeEdge ->
            "text-before-edge"

        DominantBaselineInherit ->
            "inherit"


durationToString : Duration -> String
durationToString duration =
    case duration of
        Duration clockValue ->
            clockValue

        DurationIndefinite ->
            "indefinite"


edgeModeToString : EdgeMode -> String
edgeModeToString edgeMode =
    case edgeMode of
        EdgeModeDuplicate ->
            "duplicate"

        EdgeModeWrap ->
            "wrap"

        EdgeModeNone ->
            "none"


fillRuleToString : FillRule -> String
fillRuleToString fillRule =
    case fillRule of
        FillRuleNonZero ->
            "nonzero"

        FillRuleEvenOdd ->
            "evenodd"


filterToString : Filter -> String
filterToString f =
    case f of
        FilterNone ->
            "none"

        FilterInherit ->
            "inherit"

        Filter funcIRI ->
            funcIRI


floodColorToString : FloodColor -> String
floodColorToString floodColor =
    case floodColor of
        FloodInherit ->
            "inherit"

        FloodCurrentColor ->
            "currentColor"

        Flood color ->
            colorToCssRgba color

        FloodICC iccColor ->
            iccColor


fontSizeAdjustToString : FontSizeAdjust -> String
fontSizeAdjustToString fontSizeAdjust =
    case fontSizeAdjust of
        FontSizeAdjustNone ->
            "none"

        FontSizeAdjustInherit ->
            "inherit"

        FontSizeAdjust aspect ->
            toString aspect


fontStretchToString : FontStretch -> String
fontStretchToString fontStretch =
    case fontStretch of
        FontStretchNormal ->
            "normal"

        FontStretchWider ->
            "wider"

        FontStretchNarrower ->
            "narrower"

        FontStretchUltraCondensed ->
            "ultra-condensed"

        FontStretchExtraCondensed ->
            "extra-condensed"

        FontStretchCondensed ->
            "condensed"

        FontStretchSemiCondensed ->
            "semi-condensed"

        FontStretchSemiExpanded ->
            "semi-expanded"

        FontStretchExpanded ->
            "expanded"

        FontStretchExtraExpanded ->
            "extra-expanded"

        FontStretchUltraExpanded ->
            "ultra-expanded"

        FontStretchInherit ->
            "inherit"


fontStyleToString : FontStyle -> String
fontStyleToString fontStyle =
    case fontStyle of
        FontStyleNormal ->
            "normal"

        FontStyleItalic ->
            "italic"

        FontStyleOblique ->
            "oblique"

        FontStyleInherit ->
            "inherit"


fontVariantToString : FontVariant -> String
fontVariantToString fontVariant =
    case fontVariant of
        FontVariantNormal ->
            "normal"

        FontVariantSmallCaps ->
            "small-caps"

        FontVariantInherit ->
            "inherit"


fontWeightToString : FontWeight -> String
fontWeightToString fontWeight =
    let
        {- The weight will be rounded to the nearest allowed value. Allowed values are
           multiples of 100 between 100 to 900.
        -}
        fontWeightClamped : Int -> Int
        fontWeightClamped weight =
            (((weight + 50) // 100) * 100)
                |> clamp 100 900
    in
        case fontWeight of
            FontWeightNormal ->
                "normal"

            FontWeightBold ->
                "bold"

            FontWeightBolder ->
                "bolder"

            FontWeightLighter ->
                "lighter"

            FontWeightInherit ->
                "inherit"

            FontWeight weight ->
                fontWeightClamped weight |> toString


funcTypeToString : FuncType -> String
funcTypeToString funcType =
    case funcType of
        FuncTypeIdentity ->
            "identity"

        FuncTypeTable ->
            "table"

        FuncTypeDiscrete ->
            "discrete"

        FuncTypeLinear ->
            "linear"

        FuncTypeGamma ->
            "gamma"


inValueToString : InValue -> String
inValueToString inValue =
    case inValue of
        InSourceGraphic ->
            "sourceGraphic"

        InSourceAlpha ->
            "sourceAlpha"

        InBackgroundAlpha ->
            "backgroundAlpha"

        InFillPaint ->
            "fillPaint"

        InStrokePaint ->
            "strokePaint"

        InReference str ->
            str


kerningToString : Kerning -> String
kerningToString kerning =
    case kerning of
        KerningAuto ->
            "auto"

        KerningInherit ->
            "inherit"

        KerningLength length ->
            lengthToString length


lengthToString : Length -> String
lengthToString length =
    case length of
        Cm x ->
            toString x ++ "cm"

        Em x ->
            toString x ++ "em"

        Ex x ->
            toString x ++ "ex"

        In x ->
            toString x ++ "in"

        Mm x ->
            toString x ++ "mm"

        Num x ->
            toString x

        Pc x ->
            toString x ++ "pc"

        Percent x ->
            toString x ++ "%"

        Pt x ->
            toString x ++ "pt"

        Px x ->
            toString x ++ "px"


lengthAdjustToString : LengthAdjust -> String
lengthAdjustToString lengthAdjust =
    case lengthAdjust of
        LengthAdjustSpacing ->
            "spacing"

        LengthAdjustSpacingAndGlyphs ->
            "spacingAndGlyphs"


markerCoordinateSystemToString : MarkerCoordinateSystem -> String
markerCoordinateSystemToString markerCoordinateSystem =
    case markerCoordinateSystem of
        MarkerCoordinateSystemUserSpaceOnUse ->
            "userSpaceOnUse"

        MarkerCoordinateSystemStrokeWidth ->
            "strokeWidth"


meetOrSliceToString : MeetOrSlice -> String
meetOrSliceToString meetOrSlice =
    case meetOrSlice of
        Meet ->
            "meet"

        Slice ->
            "slice"


modeToString : Mode -> String
modeToString mode =
    case mode of
        ModeNormal ->
            "normal"

        ModeMultiply ->
            "multiply"

        ModeScreen ->
            "screen"

        ModeDarken ->
            "darken"

        ModeLighten ->
            "lighten"


morphologyOperatorToString : MorphologyOperator -> String
morphologyOperatorToString morphologyOperator =
    case morphologyOperator of
        MorphologyOperatorErode ->
            "erode"

        MorphologyOperatorDilate ->
            "dilate"


opacityToString : Opacity -> String
opacityToString opacity =
    case opacity of
        Opacity n ->
            (toString n)

        OpacityInherit ->
            "inherit"


renderingToString : Rendering -> String
renderingToString rendering =
    case rendering of
        RenderingAuto ->
            "auto"

        RenderingOptimizeSpeed ->
            "optimizeSpeed"

        RenderingOptimizeQuality ->
            "optimizeQuality"

        RenderingInherit ->
            "inherit"


repeatCountToString : RepeatCount -> String
repeatCountToString repeatCount =
    case repeatCount of
        RepeatCount count ->
            toString count

        RepeatIndefinite ->
            "indefinite"


restartToString : Restart -> String
restartToString restart =
    case restart of
        RestartAlways ->
            "always"

        RestartWhenNotActive ->
            "whenNotActive"

        RestartNever ->
            "never"


scaleToString : Scale -> String
scaleToString scale =
    case scale of
        ScaleMin ->
            "min"

        ScaleMid ->
            "mid"

        ScaleMax ->
            "max"


shapeRenderingToString : ShapeRendering -> String
shapeRenderingToString shapeRendering =
    case shapeRendering of
        RenderAuto ->
            "auto"

        RenderOptimizeSpeed ->
            "optimizeSpeed"

        RenderCrispEdges ->
            "crispEdges"

        RenderGeometricPrecision ->
            "geometricPrecision"

        RenderInherit ->
            "inherit"


transformToString : Transform -> String
transformToString xform =
    let
        tr name args =
            String.concat
                [ name
                , "("
                , String.join " " (List.map toString args)
                , ")"
                ]
    in
        case xform of
            Matrix a b c d e f ->
                tr "matrix" [ a, b, c, d, e, f ]

            Rotate a x y ->
                tr "rotate" [ a, x, y ]

            Scale x y ->
                tr "scale" [ x, y ]

            SkewX x ->
                tr "skewX" [ x ]

            SkewY y ->
                tr "skewY" [ y ]

            Translate x y ->
                tr "translate" [ x, y ]


timingValueAsString : TimingValue -> String
timingValueAsString timingValue =
    case timingValue of
        TimingOffsetValue clock ->
            clock

        TimingSyncBaseValue str ->
            str

        TimingEventValue str ->
            str

        TimingRepeatValue str ->
            str

        TimingAccessKeyValue str ->
            str

        TimingWallclockSyncValue str ->
            str

        TimingIndefinite ->
            "indefinite"


turbulenceTypeToString : TurbulenceType -> String
turbulenceTypeToString turbulenceType =
    case turbulenceType of
        TurbulenceTypeFractalNoise ->
            "fractalNoise"

        TurbulenceTypeTurbulence ->
            "turbulence"


yesNoToString : YesNo -> String
yesNoToString question =
    case question of
        Yes ->
            "yes"

        No ->
            "no"
