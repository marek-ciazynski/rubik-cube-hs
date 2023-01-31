module Utils where

import Cube
import Prelude hiding (Left, Right)

edgeColorsMatches :: Color2 -> Color2 -> Bool
edgeColorsMatches (a1, a2) (b1, b2)
    | a1 == b1 && a2 == b2 = True
    | a1 == b2 && a2 == b1 = True
    | otherwise = False

edgeOrientationMatches :: Color2 -> Color2 -> Bool
edgeOrientationMatches (a1, a2) (b1, b2) =
    a1 == b1 && a2 == b2

cornerColorsMatches :: Color3 -> Color3 -> Bool
cornerColorsMatches (a1, a2, a3) (b1, b2, b3)
    | a1 == b1 && a2 == b2 && a3 == b3 = True
    | a1 == b1 && a2 == b2 && a3 == b3 = True
    | a1 == b1 && a2 == b2 && a3 == b3 = True
    | otherwise = False

cornerOrientationMatches :: Color3 -> Color3 -> Bool
cornerOrientationMatches (a1, a2) (b1, b2) =
    a1 == b1 && a2 == b2
