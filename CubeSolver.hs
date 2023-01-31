module CubeSolver where

import Cube
import Prelude hiding (Left, Right)
import TestCubes (exampleCube)
import Svg (writeCubeSvg)
import CubeRotations (applyRotations, rotateCube)
import Debug.Trace (traceShow)


moveEdgeUpAlgorithm = [F, F]
moveEdgeUpWithReorientAlgorithm = [D, R, F', R']
getMoveEdgeUpAlgorithm edgeColors = if snd edgeColors == White
    then moveEdgeUpAlgorithm
    else moveEdgeUpWithReorientAlgorithm

swapCornersAlgorithm = [R', D', R, D, R', D', R, D]


---
anyColorMatches :: Color -> Edge -> Bool
anyColorMatches color (_, (c1, c2)) = color == c1 || color == c2

edgesOfColor :: Color -> Cube -> [Edge]
edgesOfColor color Cube{edges} =
    filter (anyColorMatches color) edges

findWhiteCrossEdge Cube{edges} faceColor =
    head $ filter (anyColorMatches White) . filter (anyColorMatches faceColor) $ edges

---
crossOrderColors = [Orange, Blue, Red, Green]

solveWhiteCross :: [Color] -> Cube -> Cube
solveWhiteCross [] cube = cube
-- solveWhiteCross colors cube = foldl solveWhiteCrossEdge cube colors
solveWhiteCross (color:colors) cube = solveWhiteCross colors nextCube
    where
        nextCube = applyRotations (solveWhiteCrossEdge cube color) [U]
        -- nextCube = rotateCube U $ solveWhiteCrossEdge cube color

solveWhiteCrossEdgeAtBottom cube edge =
    applyRotations cube $ 
        if fst (pos edge) /= Front then
            (case fst (pos edge) of
                Left ->  [D]
                Right -> [D']
                Back -> [D, D]
            ) ++ getMoveEdgeUpAlgorithm (colors edge)
        else
            getMoveEdgeUpAlgorithm (colors edge)

solveWhiteCrossEdgeAtSideFace cube edge =
    applyRotations cube $ case pos edge of
        (Right, Back) -> [R]
        (Right, Front) -> [R']
        (Left, Back) -> [L']
        (Left, Front) -> [L]

solveWhiteCrossEdgeAtTop cube edge =
    applyRotations cube [F, F]

solveWhiteCrossEdge :: Cube -> Color -> Cube
solveWhiteCrossEdge cube color
    | snd edgePos == Down =  -- edge is at the bottom
        solveWhiteCrossEdgeAtBottom cube foundEdge

    | snd edgePos == Up =  -- edge is at the top
        let newCube = solveWhiteCrossEdgeAtTop cube foundEdge
        in solveWhiteCrossEdge newCube color

    | otherwise =  -- edge is at side face
        let newCube = solveWhiteCrossEdgeAtSideFace cube foundEdge
        in solveWhiteCrossEdge newCube color

    where
        foundEdge = findWhiteCrossEdge cube color
        edgePos = pos foundEdge


solveCube :: Cube -> Cube
solveCube = solveWhiteCross crossOrderColors -- $ solveNextPhast $ ...
