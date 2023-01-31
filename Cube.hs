module Cube where

import Prelude hiding (Left, Right)

-- Data types --
data Color
    = Red
    | Orange
    | Green
    | Blue
    | White
    | Yellow
  deriving (Eq, Show)

data Pos
    = Front
    | Back
    | Up
    | Down
    | Left
    | Right
    deriving (Eq, Show)

-- TODO these mappings are not used? remove?
faceColor :: Pos -> Color
faceColor Front = Orange
faceColor Back = Red
faceColor Up = White
faceColor Down = Yellow
faceColor Left = Green
faceColor Right = Blue

colorCentrePos :: Color -> Pos
colorCentrePos Orange = Front
colorCentrePos Red = Back
colorCentrePos White = Up
colorCentrePos Yellow = Down
colorCentrePos Green = Left
colorCentrePos Blue = Right

data Move = F | F' | B | B' | U | U' | D | D' | L | L' | R | R'
    deriving (Eq, Show)

type Color2 = (Color, Color)
type Color3 = (Color, Color, Color)
type Pos2 = (Pos, Pos)
type Pos3 = (Pos, Pos, Pos)

type Edge = (Pos2, Color2)
type Corner = (Pos3, Color3)
data Cube = Cube {edges :: [Edge], corners :: [Corner], solution :: [Move]}

pos = fst
colors = snd

getEdge :: Cube -> Pos2 -> Edge
getEdge Cube{edges} pos = head $ filter matchPos edges
    where
        matchPos (p, _) = p == pos


getCorner :: Cube -> Pos3 -> Corner
getCorner Cube{corners} pos = head $ filter matchPos corners
    where
        matchPos (p, _) = p == pos

colorX :: Corner -> Color
colorX (_, (x, _, _)) = x
colorY :: Corner -> Color
colorY (_, (_, y, _)) = y
colorZ :: Corner -> Color
colorZ (_, (_, _, z)) = z

colorA :: Edge -> Color
colorA (_, (a, _)) = a
colorB :: Edge -> Color
colorB (_, (_, b)) = b
