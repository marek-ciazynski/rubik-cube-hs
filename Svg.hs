module Svg where

import Cube
import Prelude hiding (Left, Right)
import System.Environment (getArgs)
import System.IO (openFile, IOMode (WriteMode))
import TestCubes (aCube, solvedCube)


faceColorToHex :: Color -> String
faceColorToHex color = case color of
                            White -> "#f2f2f2"
                            Orange -> "#ff7300"
                            Green -> "#5aa02c"
                            Blue -> "#08a"
                            Red -> "#a00"
                            Yellow -> "#fc0"


cubeToSvg :: Cube -> String
cubeToSvg cube =
    "<svg width=\"400\" height=\"300\" version=\"1.1\" viewBox=\"0 0 105.83 79.375\" xmlns=\"http://www.w3.org/2000/svg\">" ++
    "    <g transform=\"translate(-44.857 -84.625)\" stroke=\"#808080\" stroke-width=\".26458\">" ++
    "        <g transform=\"translate(1.9844 1.4552)\"> <!-- Up face -->" ++
    "            <rect fill=\"" ++ faceColorToHex (colorZ $ corner (Left,Back,Up)) ++ "\" x=\"70.39\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Back,Up)) ++ "\" x=\"78.856\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorZ $ corner (Right,Back,Up)) ++ "\" x=\"87.323\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Left,Up)) ++ "\" x=\"70.39\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex White ++ "\" x=\"78.856\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Right,Up)) ++ "\" x=\"87.323\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorZ $ corner (Left,Front,Up)) ++ "\" x=\"70.39\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Front,Up)) ++ "\" x=\"78.856\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorZ $ corner (Right,Front,Up)) ++ "\" x=\"87.323\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "        </g>" ++
    "        <g transform=\"translate(1.9844 26.855)\"> <!-- Front face -->" ++
    "            <rect fill=\"" ++ faceColorToHex (colorY $ corner (Left,Front,Up)) ++ "\" x=\"70.39\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Front,Up)) ++ "\" x=\"78.856\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorY $ corner (Right,Front,Up)) ++ "\" x=\"87.323\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Left,Front)) ++ "\" x=\"70.39\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex Orange ++ "\" x=\"78.856\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Right,Front)) ++ "\" x=\"87.323\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorY $ corner (Left,Front,Down)) ++ "\" x=\"70.39\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Front,Down)) ++ "\" x=\"78.856\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorY $ corner (Right,Front,Down)) ++ "\" x=\"87.323\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "        </g>" ++
    "        <g transform=\"translate(-23.416 26.855)\"> <!-- Left face -->" ++
    "            <rect fill=\"" ++ faceColorToHex (colorX $ corner (Left,Back,Up)) ++ "\" x=\"70.39\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Left,Up)) ++ "\" x=\"78.856\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorX $ corner (Left,Front,Up)) ++ "\" x=\"87.323\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Left,Back)) ++ "\" x=\"70.39\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex Green ++ "\" x=\"78.856\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Left,Front)) ++ "\" x=\"87.323\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorX $ corner (Left,Back,Down)) ++ "\" x=\"70.39\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Left,Down)) ++ "\" x=\"78.856\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorX $ corner (Left,Front,Down)) ++ "\" x=\"87.323\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "        </g>" ++
    "        <g transform=\"translate(27.384 26.855)\"> <!-- Right face -->" ++
    "            <rect fill=\"" ++ faceColorToHex (colorX $ corner (Right,Front,Up)) ++ "\" x=\"70.39\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Right,Up)) ++ "\" x=\"78.856\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorX $ corner (Right,Back,Up)) ++ "\" x=\"87.323\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Right,Front)) ++ "\" x=\"70.39\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex Blue ++ "\" x=\"78.856\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Right,Back)) ++ "\" x=\"87.323\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorX $ corner (Right,Front,Down)) ++ "\" x=\"70.39\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Right,Down)) ++ "\" x=\"78.856\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorX $ corner (Right,Back,Down)) ++ "\" x=\"87.323\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "        </g>" ++
    "        <g transform=\"translate(52.784 26.855)\"> <!-- Back face -->" ++
    "            <rect fill=\"" ++ faceColorToHex (colorY $ corner (Right,Back,Up)) ++ "\" x=\"70.39\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Back,Up)) ++ "\" x=\"78.856\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorY $ corner (Left,Back,Up)) ++ "\" x=\"87.323\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Right,Back)) ++ "\" x=\"70.39\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex Red ++ "\" x=\"78.856\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Left,Back)) ++ "\" x=\"87.323\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorY $ corner (Right,Back,Down)) ++ "\" x=\"70.39\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorA $ edge (Back,Down)) ++ "\" x=\"78.856\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorY $ corner (Left,Back,Down)) ++ "\" x=\"87.323\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "        </g>" ++
    "        <g transform=\"translate(1.9844 52.255)\"> <!-- Down face -->" ++
    "            <rect fill=\"" ++ faceColorToHex (colorZ $ corner (Left,Front,Down)) ++ "\" x=\"70.39\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Front,Down)) ++ "\" x=\"78.856\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorZ $ corner (Right,Front,Down)) ++ "\" x=\"87.323\" y=\"84.757\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Left,Down)) ++ "\" x=\"70.39\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex Yellow ++ "\" x=\"78.856\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Right,Down)) ++ "\" x=\"87.323\" y=\"93.224\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorZ $ corner (Left,Back,Down)) ++ "\" x=\"70.39\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorB $ edge (Back,Down)) ++ "\" x=\"78.856\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "            <rect fill=\"" ++ faceColorToHex (colorZ $ corner (Right,Back,Down)) ++ "\" x=\"87.323\" y=\"101.69\" width=\"8.4667\" height=\"8.4667\" ry=\"0\"/>" ++
    "        </g>" ++
    "    </g>" ++
    "</svg>"
    where
        edge = getEdge cube
        corner = getCorner cube

writeCubeSvg = writeFile "result.svg" . cubeToSvg

main = do
    -- writeCubeSvg solvedCube
    writeCubeSvg aCube
