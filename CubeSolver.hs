module CubeSolver where

import Cube
import Prelude hiding (Left, Right)
import TestCubes (exampleCube)
import Svg (writeCubeSvg)
import CubeRotations (applyRotations, rotateCube)
import Debug.Trace (traceShow)


-- Rotation algorithms --
moveEdgeUpAlgorithm = [F, F]
moveEdgeUpWithReorientAlgorithm = [D, R, F', R']
getMoveEdgeUpAlgorithm :: Color2 -> [Rotation]
getMoveEdgeUpAlgorithm edgeColors = if snd edgeColors == White
    then moveEdgeUpAlgorithm
    else moveEdgeUpWithReorientAlgorithm

swapCornersAlgorithm = [R', D', R, D, R', D', R, D]


-- Helper functions --
anyColorMatches :: Color -> Edge -> Bool
anyColorMatches color (_, (c1, c2)) = color == c1 || color == c2

edgesOfColor :: Color -> Cube -> [Edge]
edgesOfColor color Cube{edges} =
    filter (anyColorMatches color) edges

findWhiteCrossEdge Cube{edges} faceColor =
    head $ filter (anyColorMatches White) . filter (anyColorMatches faceColor) $ edges


-- Solve white cross --
crossOrderColors = [Orange, Blue, Red, Green]

solveWhiteCross :: [Color] -> Cube -> Cube
solveWhiteCross [] cube = cube
solveWhiteCross (color:colors) cube = solveWhiteCross colors nextCube
    where
        nextCube = applyRotations (solveWhiteCrossEdge cube color) [U]

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
        (Right, Back) -> [R,D,R']
        (Right, Front) -> [R',D,R]
        (Left, Back) -> [L',D',L]
        (Left, Front) -> [L,D',L']

solveWhiteCrossEdgeAtTop :: Cube -> Edge -> Cube
solveWhiteCrossEdgeAtTop cube edge =
    applyRotations cube $ case sidePos of
        Front -> [F, F]
        Left -> [L, L]
        Back -> [B, B]
        Right -> [R, R]
    where
        sidePos = fst (pos edge)

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


-- Solve white corners --
solveWhiteCorners :: Cube -> Cube
solveWhiteCorners = id -- placeholder


-- Solve whole cube --
solveCube :: Cube -> Cube
solveCube = solveWhiteCross crossOrderColors . solveWhiteCorners -- $ solveNextPhast $ ...

solveCubeWithSvgSteps :: Cube -> IO Cube
solveCubeWithSvgSteps cube = do
    let phase1 = solveWhiteCross crossOrderColors cube
    writeCubeSvg "results/phase1.svg" phase1
    let phase2 = solveWhiteCorners phase1
    -- writeCubeSvg "results/phase2.svg" phase1
    -- TODO next phases
    return phase2
