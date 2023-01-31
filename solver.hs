import System.Environment (getArgs)
import Cube
import CubeReader (readCubeFile)
import CubeSolver (solveCube)
import Svg (writeCubeSvg)

main = do
    args <- getArgs
    let fileName = head args
    text <- readFile fileName
    cube <- readCubeFile fileName
    writeCubeSvg "results/input.svg" cube

    let resultCube = solveCube cube

    writeCubeSvg "results/solved.svg" resultCube
    putStr "Moves: "
    print $ solution resultCube
    -- print $ resultCube
