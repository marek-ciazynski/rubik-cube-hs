module CubeRotations where

import Cube
import Prelude hiding (Left, Right)
import Debug.Trace (traceShow)

-- Reorients colors by rotating the corner around X, Y or Z axis
type Reorientation = Corner -> Corner
reorientX :: Reorientation
reorientX (pos, (x,y,z)) = (pos, (x,z,y))
reorientY :: Reorientation
reorientY (pos, (x,y,z)) = (pos, (z,y,x))
reorientZ :: Reorientation
reorientZ (pos, (x,y,z)) = (pos, (y,x,z))

-- General face rotating functions --
type FourEdgesPos = (Pos2, Pos2, Pos2, Pos2)
type FourCornersPos = (Pos3, Pos3, Pos3, Pos3)
data RotationDirection = Clockwise | AntiClockwise deriving (Eq, Show)

getEdgeMapping :: RotationDirection -> Cube -> FourEdgesPos -> Edge -> Color2
getEdgeMapping Clockwise cube (edge_l, edge_t, edge_r, edge_b) (pos, color)
    | pos == edge_l = colors $ getEdge cube edge_b
    | pos == edge_b = colors $ getEdge cube edge_r
    | pos == edge_r = colors $ getEdge cube edge_t
    | pos == edge_t = colors $ getEdge cube edge_l
    | otherwise = color
getEdgeMapping AntiClockwise cube (edge_l, edge_t, edge_r, edge_b) (pos, color)
    | pos == edge_l = colors $ getEdge cube edge_t
    | pos == edge_t = colors $ getEdge cube edge_r
    | pos == edge_r = colors $ getEdge cube edge_b
    | pos == edge_b = colors $ getEdge cube edge_l
    | otherwise = color

getCornerMapping :: RotationDirection -> Cube -> Reorientation -> FourCornersPos -> Corner -> Corner
getCornerMapping Clockwise cube cornerReorientation (corner_xy, corner_xY, corner_XY, corner_Xy) corner
    | pos corner == corner_xy = cornerReorientation $ getCorner cube corner_Xy
    | pos corner == corner_Xy = cornerReorientation $ getCorner cube corner_XY
    | pos corner == corner_XY = cornerReorientation $ getCorner cube corner_xY
    | pos corner == corner_xY = cornerReorientation $ getCorner cube corner_xy
    | otherwise = corner
getCornerMapping AntiClockwise cube cornerReorientation (corner_xy, corner_xY, corner_XY, corner_Xy) corner
    | pos corner == corner_xy = cornerReorientation $ getCorner cube corner_xY
    | pos corner == corner_xY = cornerReorientation $ getCorner cube corner_XY
    | pos corner == corner_XY = cornerReorientation $ getCorner cube corner_Xy
    | pos corner == corner_Xy = cornerReorientation $ getCorner cube corner_xy
    | otherwise = corner


rotationDirection :: Rotation -> RotationDirection
rotationDirection r
    | r `elem` [F, B, U, D, L, R] = Clockwise
    | otherwise = AntiClockwise

rotateCubeGeneric :: Reorientation -> FourCornersPos -> FourEdgesPos -> Rotation -> RotationDirection -> Cube -> Cube
rotateCubeGeneric cornerReorientation mappedCorners mappedEdges rot rotDir cube =
  Cube
    { edges = [(pos edge, edgeMapping edge) | edge <- edges cube],
      corners = [(pos corner, colors $ cornerMapping corner) | corner <- corners cube],
      solution = rot : solution cube
    }
  where
    -- rotDir = rotationDirection rot 
    edgeMapping = getEdgeMapping rotDir cube mappedEdges
    cornerMapping = getCornerMapping rotDir cube cornerReorientation mappedCorners

applyRotations :: Cube -> [Rotation] -> Cube
applyRotations cube rotations = traceShow rotations $ foldr rotateCube cube (reverse rotations)


-- Specific rotations --
rotateCube :: Rotation -> Cube -> Cube
-- rotations aroud X-axis
rotateCube L = rotateCubeX Left L Clockwise
rotateCube L' = rotateCubeX Left L' AntiClockwise
rotateCube R = rotateCubeX Right R AntiClockwise
rotateCube R' = rotateCubeX Right R' Clockwise
-- rotations aroud Y-axis
rotateCube F = fixEdgesOrientation Front . rotateCubeY Front F Clockwise
rotateCube F' = fixEdgesOrientation Front . rotateCubeY Front F' AntiClockwise
rotateCube B = fixEdgesOrientation Back . rotateCubeY Back B AntiClockwise
rotateCube B' = fixEdgesOrientation Back . rotateCubeY Back B' Clockwise
-- rotations aroud Z-axis
rotateCube U = rotateCubeZ Up U Clockwise
rotateCube U' = rotateCubeZ Up U' AntiClockwise
rotateCube D = rotateCubeZ Down D AntiClockwise
rotateCube D' = rotateCubeZ Down D' Clockwise

rotateCubeX xPos = rotateCubeGeneric reorientX mappedCorners mappedEdges where
    mappedEdges = (
            (xPos, Back),
            (xPos, Up),
            (xPos, Front),
            (xPos, Down)
        )
    mappedCorners = (
            (xPos, Back, Down),
            (xPos, Back, Up),
            (xPos, Front, Up),
            (xPos, Front, Down)
        )

rotateCubeY yPos = rotateCubeGeneric reorientY mappedCorners mappedEdges where
    mappedEdges = (
            (Left, yPos),
            (yPos, Up),
            (Right, yPos),
            (yPos, Down)
        )
    mappedCorners = (
            (Left, yPos, Down),
            (Left, yPos, Up),
            (Right, yPos, Up),
            (Right, yPos, Down)
        )

rotateCubeZ zPos = rotateCubeGeneric reorientZ mappedCorners mappedEdges where
    mappedEdges = (
            (Left, zPos),
            (Back, zPos),
            (Right, zPos),
            (Front, zPos)
        )
    mappedCorners = (
            (Left, Front, zPos),
            (Left, Back, zPos),
            (Right, Back, zPos),
            (Right, Front, zPos)
        )

fixEdgesOrientation :: Pos -> Cube -> Cube
fixEdgesOrientation yPos cube =
    Cube {
        edges = map fixAffected (edges cube),
        corners = corners cube,
        solution = solution cube
    }
    where
        fixAffected e = if isAffectedEdge e then swapColor2 e else e
        isAffectedEdge ((p1, p2), _) = p1 == yPos || p2 == yPos
        swapColor2 (pos, (c1,c2)) = (pos, (c2,c1))
