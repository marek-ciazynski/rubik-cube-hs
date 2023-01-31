import System.Environment (getArgs)
import Cube
import CubeReader (readCube, readCubeFile)
import CubeRotations
import Svg (writeCubeSvg)

main = do
    args <- getArgs
    let fileName = head args
    text <- readFile fileName
    cube <- readCubeFile fileName
    writeCubeSvg "result.svg" cube
    let rotatedCube = rotateCube B' cube
    writeCubeSvg "rotU'.svg" rotatedCube
    putStr "Moves: "
    print $ solution rotatedCube
