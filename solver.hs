import System.Environment (getArgs)
import Cube
import CubeReader (readCubeFile)
import CubeSolver (solveCube, solveCubeWithSvgSteps)
import Svg (writeCubeSvg)
import Debug.Trace (traceShow)
import CubeRotations (applyRotations)

main = do
    args <- getArgs
    let fileName = head args
    text <- readFile fileName
    cube <- readCubeFile fileName
    writeCubeSvg "results/input.svg" cube

    -- let resultCube = solveCube cube
    resultCube <- solveCubeWithSvgSteps cube

    writeCubeSvg "results/solved.svg" resultCube
    putStr "Moves: "
    print $ reverse $ solution resultCube
    -- print $ resultCube
    putStrLn "Wrote `results/solved.svg` SVG file."
