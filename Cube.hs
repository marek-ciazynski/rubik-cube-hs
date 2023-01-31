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

faceColor :: Pos -> Color
faceColor Front = Green
faceColor Back = Blue
faceColor Up = White
faceColor Down = Yellow
faceColor Left = Red
faceColor Right = Orange

colorCentrePos :: Color -> Pos
colorCentrePos Green = Front
colorCentrePos Blue = Back
colorCentrePos White = Up
colorCentrePos Yellow = Down
colorCentrePos Red = Left
colorCentrePos Orange = Right

data Move = F | F' | B | B' | U | U' | D | D' | L | L' | R | R'
    deriving (Eq, Show)

type Color2 = (Color, Color)
type Color3 = (Color, Color, Color)
type Pos2 = (Pos, Pos)
type Pos3 = (Pos, Pos, Pos)

-- type Edge = (Pos2, Color2)
-- type Corner = (Pos3, Color3)
-- data Cubie = Edge Pos2 Color2 | Corner Pos3 Color3
-- type Cube = [Cubie]

type Edge = (Pos2, Color2)
type Corner = (Pos3, Color3)
-- type Cube = ([Edge], [Corner])
data Cube = Cube {edges :: [Edge], corners :: [Corner]} -- , solution :: [Move]}

pos = fst
colors = snd


-- "Bussiness logic" functions --
anyColorMatches :: Color -> Edge -> Bool
anyColorMatches color (_, (c1, c2)) = color == c1 || color == c2
    
-- edgesOfColor :: Color -> Cube -> [Edge]
-- edgesOfColor color Cube{edges} =
--     filter (anyColorMatches color) edges


findWhiteCrossEdge Cube{edges} faceColor =
    head $ filter (anyColorMatches White) . filter (anyColorMatches faceColor) $ edges

solveCrossEdge cube withColor
    | pos foundEdge = True
    | otherwise = False
    where
        foundEdge = findWhiteCrossEdge cube withColor




-- TODO next --
-- Rotations


-- Searching edges/corners
