module TestCubes where

import Cube
import Prelude hiding (Left, Right)
import Utils (splitByPredicate)
import CubeReader (readCube)

exampleCube :: Cube
exampleCube = Cube {edges, corners, solution=[]}
    where
        edges = [
                -- first layer
                ((Front,Up), (Yellow, Orange)),
                ((Left,Up),  (Orange, Green)),
                ((Back,Up),  (Yellow, Green)),
                ((Right,Up), (Red, Yellow)),

                -- middle layer
                ((Left,Front),  (Red, Blue)),
                ((Left,Back),   (Blue, Yellow)),
                ((Right,Back),  (White, Green)),
                ((Right,Front), (Blue, White)),
                
                -- bottom layer
                ((Front,Down), (Red, White)),
                ((Left,Down),  (Red, Green)),
                ((Back,Down),  (Blue, Orange)),
                ((Right,Down), (Orange, White))
            ]
        corners = [
                -- top layer
                ((Left,Front,Up),  (White, Orange, Blue)),
                ((Left,Back,Up),   (Green, Yellow, Red)),
                ((Right,Front,Up), (White, Red, Blue)),
                ((Right,Back,Up),  (Orange, White, Green)),
                -- bottom layer
                ((Left,Front,Down),  (Green, Orange, Yellow)),
                ((Left,Back,Down),   (Blue, Orange, Yellow)),
                ((Right,Front,Down), (Red, Blue, Yellow)),
                ((Right,Back,Down),  (Green, Red, White))
            ]

solvedCube :: Cube
solvedCube = Cube {edges, corners, solution=[]}
    where
        edges = [
                -- first layer
                ((Front,Up), (faceColor Front, faceColor Up)),
                ((Left,Up), (faceColor Left, faceColor Up)),
                ((Back,Up), (faceColor Back, faceColor Up)),
                ((Right,Up), (faceColor Right, faceColor Up)),

                -- middle layer
                ((Left,Front), (faceColor Left,faceColor Front)),
                ((Left,Back), (faceColor Left,faceColor Back)),
                ((Right,Back), (faceColor Right,faceColor Back)),
                ((Right,Front), (faceColor Right,faceColor Front)),
                
                -- bottom layer
                ((Front,Down), (faceColor Front,faceColor Down)),
                ((Left,Down), (faceColor Left,faceColor Down)),
                ((Back,Down), (faceColor Back,faceColor Down)),
                ((Right,Down), (faceColor Right,faceColor Down))
            ]
        corners = [
                -- top layer
                ((Left,Front,Up), (faceColor Left, faceColor Front, faceColor Up)),
                ((Left,Back,Up), (faceColor Left, faceColor Back, faceColor Up)),
                ((Right,Front,Up), (faceColor Right, faceColor Front, faceColor Up)),
                ((Right,Back,Up), (faceColor Right, faceColor Back, faceColor Up)),
                -- bottom layer
                ((Left,Front,Down), (faceColor Left, faceColor Front, faceColor Down)),
                ((Left,Back,Down), (faceColor Left, faceColor Back, faceColor Down)),
                ((Right,Front,Down), (faceColor Right, faceColor Front, faceColor Down)),
                ((Right,Back,Down), (faceColor Right, faceColor Back, faceColor Down))
            ]
