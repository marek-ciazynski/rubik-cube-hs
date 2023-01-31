module CubeSolver where

import Cube
import Prelude hiding (Left, Right)


-- "Bussiness logic" functions --
anyColorMatches :: Color -> Edge -> Bool
anyColorMatches color (_, (c1, c2)) = color == c1 || color == c2
    
-- edgesOfColor :: Color -> Cube -> [Edge]
-- edgesOfColor color Cube{edges} =
--     filter (anyColorMatches color) edges


findWhiteCrossEdge Cube{edges} faceColor =
    head $ filter (anyColorMatches White) . filter (anyColorMatches faceColor) $ edges

-- solveCrossEdge cube withColor
--     | pos foundEdge = True
--     | otherwise = False
--     where
--         foundEdge = findWhiteCrossEdge cube withColor

-- Read/show cube --
