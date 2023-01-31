module CubeReader where

import Cube
import Prelude hiding (Left, Right)
import Utils (splitByPredicate)


edgesReadingOrder = [
    -- top layer
    (Front,Up),
    (Left,Up),
    (Back,Up),
    (Right,Up),
    -- middle layer
    (Left,Front),
    (Left,Back),
    (Right,Back),
    (Right,Front),
    -- bottom layer
    (Front,Down),
    (Left,Down),
    (Back,Down),
    (Right,Down)]

cornersReadingOrder = [
    -- top layer
    (Left,Front,Up),
    (Left,Back,Up),
    (Right,Front,Up),
    (Right,Back,Up),
    -- bottom layer
    (Left,Front,Down),
    (Left,Back,Down),
    (Right,Front,Down),
    (Right,Back,Down)]

parseColorLetter :: Char -> Color
parseColorLetter letter = case letter of
                                'W' -> White
                                'O' -> Orange
                                'G' -> Green
                                'B' -> Blue
                                'R' -> Red
                                'Y' -> Yellow

readCubeEdges :: [String] -> [Edge]
readCubeEdges lines =
    [(pos, parseColors line) | (pos, line) <- zip edgesReadingOrder lines]
    where
        parseColors [a,b] = (parseColorLetter a, parseColorLetter b)

readCubeCorners :: [String] -> [Corner]
readCubeCorners lines =
    [(pos, parseColors line) | (pos, line) <- zip cornersReadingOrder lines]
    where
        parseColors [x,y,z] = (parseColorLetter x, parseColorLetter y, parseColorLetter z)

readCube :: [String] -> Cube
readCube lines = Cube {edges, corners, solution=[]}
    where
        (edgeLines, cornerLines) = splitByPredicate (== "") lines
        edges = readCubeEdges edgeLines
        corners = readCubeCorners cornerLines

readCubeFile fileName = do
    text <- readFile fileName
    return $ readCube (lines text)
