import System.Environment (getArgs)
import Svg (writeCubeSvg)
import CubeReader (readCube, readCubeFile)

main = do
    args <- getArgs
    let fileName = head args
    text <- readFile fileName
    putStr text
    cube <- readCubeFile fileName
    writeCubeSvg "result.svg" cube
