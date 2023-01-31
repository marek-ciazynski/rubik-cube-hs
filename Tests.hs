module Tests where

import Cube
import Prelude hiding (Left, Right)
import CubeRotations (rotateCube)
import TestCubes (exampleCube)

-- Test rotations: --

-- given
cubeRotated U =
  Cube
    { edges =
        [ ((Front, Up), (Red, Yellow)),
          ((Left, Up), (Yellow, Orange)),
          ((Back, Up), (Orange, Green)),
          ((Right, Up), (Yellow, Green)),
          ((Left, Front), (Red, Blue)),
          ((Left, Back), (Blue, Yellow)),
          ((Right, Back), (White, Green)),
          ((Right, Front), (Blue, White)),
          ((Front, Down), (Red, White)),
          ((Left, Down), (Red, Green)),
          ((Back, Down), (Blue, Orange)),
          ((Right, Down), (Orange, White))
        ],
      corners =
        [ ((Left, Front, Up), (Red, White, Blue)),
          ((Left, Back, Up), (Orange, White, Blue)),
          ((Right, Front, Up), (White, Orange, Green)),
          ((Right, Back, Up), (Yellow, Green, Red)),
          ((Left, Front, Down), (Green, Orange, Yellow)),
          ((Left, Back, Down), (Blue, Orange, Yellow)),
          ((Right, Front, Down), (Red, Blue, Yellow)),
          ((Right, Back, Down), (Green, Red, White))
        ],
      solution = []
    }

cubeRotated U' =
  Cube
    { edges =
        [ ((Front, Up), (Orange, Green)),
          ((Left, Up), (Yellow, Green)),
          ((Back, Up), (Red, Yellow)),
          ((Right, Up), (Yellow, Orange)),
          ((Left, Front), (Red, Blue)),
          ((Left, Back), (Blue, Yellow)),
          ((Right, Back), (White, Green)),
          ((Right, Front), (Blue, White)),
          ((Front, Down), (Red, White)),
          ((Left, Down), (Red, Green)),
          ((Back, Down), (Blue, Orange)),
          ((Right, Down), (Orange, White))
        ],
      corners =
        [ ((Left, Front, Up), (Yellow, Green, Red)),
          ((Left, Back, Up), (White, Orange, Green)),
          ((Right, Front, Up), (Orange, White, Blue)),
          ((Right, Back, Up), (Red, White, Blue)),
          ((Left, Front, Down), (Green, Orange, Yellow)),
          ((Left, Back, Down), (Blue, Orange, Yellow)),
          ((Right, Front, Down), (Red, Blue, Yellow)),
          ((Right, Back, Down), (Green, Red, White))
        ],
      solution = []
    }

cubeRotated D =
  Cube
    { edges =
        [ ((Front, Up), (Yellow, Orange)),
          ((Left, Up), (Orange, Green)),
          ((Back, Up), (Yellow, Green)),
          ((Right, Up), (Red, Yellow)),
          ((Left, Front), (Red, Blue)),
          ((Left, Back), (Blue, Yellow)),
          ((Right, Back), (White, Green)),
          ((Right, Front), (Blue, White)),
          ((Front, Down), (Red, Green)),
          ((Left, Down), (Blue, Orange)),
          ((Back, Down), (Orange, White)),
          ((Right, Down), (Red, White))
        ],
      corners =
        [ ((Left, Front, Up), (White, Orange, Blue)),
          ((Left, Back, Up), (Green, Yellow, Red)),
          ((Right, Front, Up), (White, Red, Blue)),
          ((Right, Back, Up), (Orange, White, Green)),
          ((Left, Front, Down), (Orange, Blue, Yellow)),
          ((Left, Back, Down), (Red, Green, White)),
          ((Right, Front, Down), (Orange, Green, Yellow)),
          ((Right, Back, Down), (Blue, Red, Yellow))
        ],
      solution = []
    }

cubeRotated D' =
  Cube
    { edges =
        [ ((Front, Up), (Yellow, Orange)),
          ((Left, Up), (Orange, Green)),
          ((Back, Up), (Yellow, Green)),
          ((Right, Up), (Red, Yellow)),
          ((Left, Front), (Red, Blue)),
          ((Left, Back), (Blue, Yellow)),
          ((Right, Back), (White, Green)),
          ((Right, Front), (Blue, White)),
          ((Front, Down), (Orange, White)),
          ((Left, Down), (Red, White)),
          ((Back, Down), (Red, Green)),
          ((Right, Down), (Blue, Orange))
        ],
      corners =
        [ ((Left, Front, Up), (White, Orange, Blue)),
          ((Left, Back, Up), (Green, Yellow, Red)),
          ((Right, Front, Up), (White, Red, Blue)),
          ((Right, Back, Up), (Orange, White, Green)),
          ((Left, Front, Down), (Blue, Red, Yellow)),
          ((Left, Back, Down), (Orange, Green, Yellow)),
          ((Right, Front, Down), (Red, Green, White)),
          ((Right, Back, Down), (Orange, Blue, Yellow))
        ],
      solution = []
    }

cubeRotated F =
  Cube
    { edges =
        [ ((Front, Up), (Blue, Red)),
          ((Left, Up), (Orange, Green)),
          ((Back, Up), (Yellow, Green)),
          ((Right, Up), (Red, Yellow)),
          ((Left, Front), (White, Red)),
          ((Left, Back), (Blue, Yellow)),
          ((Right, Back), (White, Green)),
          ((Right, Front), (Orange, Yellow)),
          ((Front, Down), (White, Blue)),
          ((Left, Down), (Red, Green)),
          ((Back, Down), (Blue, Orange)),
          ((Right, Down), (Orange, White))
        ],
      corners =
        [ ((Left, Front, Up), (Yellow, Orange, Green)),
          ((Left, Back, Up), (Green, Yellow, Red)),
          ((Right, Front, Up), (Blue, Orange, White)),
          ((Right, Back, Up), (Orange, White, Green)),
          ((Left, Front, Down), (Yellow, Blue, Red)),
          ((Left, Back, Down), (Blue, Orange, Yellow)),
          ((Right, Front, Down), (Blue, Red, White)),
          ((Right, Back, Down), (Green, Red, White))
        ],
      solution = []
    }

cubeRotated F' =
  Cube
    { edges =
        [ ((Front, Up), (White, Blue)),
          ((Left, Up), (Orange, Green)),
          ((Back, Up), (Yellow, Green)),
          ((Right, Up), (Red, Yellow)),
          ((Left, Front), (Orange, Yellow)),
          ((Left, Back), (Blue, Yellow)),
          ((Right, Back), (White, Green)),
          ((Right, Front), (White, Red)),
          ((Front, Down), (Blue, Red)),
          ((Left, Down), (Red, Green)),
          ((Back, Down), (Blue, Orange)),
          ((Right, Down), (Orange, White))
        ],
      corners =
        [ ((Left, Front, Up), (Blue, Red, White)),
          ((Left, Back, Up), (Green, Yellow, Red)),
          ((Right, Front, Up), (Yellow, Blue, Red)),
          ((Right, Back, Up), (Orange, White, Green)),
          ((Left, Front, Down), (Blue, Orange, White)),
          ((Left, Back, Down), (Blue, Orange, Yellow)),
          ((Right, Front, Down), (Yellow, Orange, Green)),
          ((Right, Back, Down), (Green, Red, White))
        ],
      solution = []
    }

cubeRotated B =
  Cube
    { edges =
        [ ((Front, Up), (Yellow, Orange)),
          ((Left, Up), (Orange, Green)),
          ((Back, Up), (Green, White)),
          ((Right, Up), (Red, Yellow)),
          ((Left, Front), (Red, Blue)),
          ((Left, Back), (Green, Yellow)),
          ((Right, Back), (Orange, Blue)),
          ((Right, Front), (Blue, White)),
          ((Front, Down), (Red, White)),
          ((Left, Down), (Red, Green)),
          ((Back, Down), (Yellow, Blue)),
          ((Right, Down), (Orange, White))
        ],
      corners =
        [ ((Left, Front, Up), (White, Orange, Blue)),
          ((Left, Back, Up), (Green, White, Orange)),
          ((Right, Front, Up), (White, Red, Blue)),
          ((Right, Back, Up), (White, Red, Green)),
          ((Left, Front, Down), (Green, Orange, Yellow)),
          ((Left, Back, Down), (Red, Yellow, Green)),
          ((Right, Front, Down), (Red, Blue, Yellow)),
          ((Right, Back, Down), (Yellow, Orange, Blue))
        ],
      solution = []
    }

cubeRotated B' =
  Cube
    { edges =
        [ ((Front, Up), (Yellow, Orange)),
          ((Left, Up), (Orange, Green)),
          ((Back, Up), (Yellow, Blue)),
          ((Right, Up), (Red, Yellow)),
          ((Left, Front), (Red, Blue)),
          ((Left, Back), (Orange, Blue)),
          ((Right, Back), (Green, Yellow)),
          ((Right, Front), (Blue, White)),
          ((Front, Down), (Red, White)),
          ((Left, Down), (Red, Green)),
          ((Back, Down), (Green, White)),
          ((Right, Down), (Orange, White))
        ],
      corners =
        [ ((Left, Front, Up), (White, Orange, Blue)),
          ((Left, Back, Up), (Yellow, Orange, Blue)),
          ((Right, Front, Up), (White, Red, Blue)),
          ((Right, Back, Up), (Red, Yellow, Green)),
          ((Left, Front, Down), (Green, Orange, Yellow)),
          ((Left, Back, Down), (White, Red, Green)),
          ((Right, Front, Down), (Red, Blue, Yellow)),
          ((Right, Back, Down), (Green, White, Orange))
        ],
      solution = []
    }

cubeRotated L =
  Cube
    { edges =
        [ ((Front, Up), (Yellow, Orange)),
          ((Left, Up), (Blue, Yellow)),
          ((Back, Up), (Yellow, Green)),
          ((Right, Up), (Red, Yellow)),
          ((Left, Front), (Orange, Green)),
          ((Left, Back), (Red, Green)),
          ((Right, Back), (White, Green)),
          ((Right, Front), (Blue, White)),
          ((Front, Down), (Red, White)),
          ((Left, Down), (Red, Blue)),
          ((Back, Down), (Blue, Orange)),
          ((Right, Down), (Orange, White))
        ],
      corners =
        [ ((Left, Front, Up), (Green, Red, Yellow)),
          ((Left, Back, Up), (Blue, Yellow, Orange)),
          ((Right, Front, Up), (White, Red, Blue)),
          ((Right, Back, Up), (Orange, White, Green)),
          ((Left, Front, Down), (White, Blue, Orange)),
          ((Left, Back, Down), (Green, Yellow, Orange)),
          ((Right, Front, Down), (Red, Blue, Yellow)),
          ((Right, Back, Down), (Green, Red, White))
        ],
      solution = []
    }

cubeRotated L' =
  Cube
    { edges =
        [ ((Front, Up), (Yellow, Orange)),
          ((Left, Up), (Red, Blue)),
          ((Back, Up), (Yellow, Green)),
          ((Right, Up), (Red, Yellow)),
          ((Left, Front), (Red, Green)),
          ((Left, Back), (Orange, Green)),
          ((Right, Back), (White, Green)),
          ((Right, Front), (Blue, White)),
          ((Front, Down), (Red, White)),
          ((Left, Down), (Blue, Yellow)),
          ((Back, Down), (Blue, Orange)),
          ((Right, Down), (Orange, White))
        ],
      corners =
        [ ((Left, Front, Up), (Green, Yellow, Orange)),
          ((Left, Back, Up), (White, Blue, Orange)),
          ((Right, Front, Up), (White, Red, Blue)),
          ((Right, Back, Up), (Orange, White, Green)),
          ((Left, Front, Down), (Blue, Yellow, Orange)),
          ((Left, Back, Down), (Green, Red, Yellow)),
          ((Right, Front, Down), (Red, Blue, Yellow)),
          ((Right, Back, Down), (Green, Red, White))
        ],
      solution = []
    }

cubeRotated R =
  Cube
    { edges =
        [ ((Front, Up), (Yellow, Orange)),
          ((Left, Up), (Orange, Green)),
          ((Back, Up), (Yellow, Green)),
          ((Right, Up), (Blue, White)),
          ((Left, Front), (Red, Blue)),
          ((Left, Back), (Blue, Yellow)),
          ((Right, Back), (Red, Yellow)),
          ((Right, Front), (Orange, White)),
          ((Front, Down), (Red, White)),
          ((Left, Down), (Red, Green)),
          ((Back, Down), (Blue, Orange)),
          ((Right, Down), (White, Green))
        ],
      corners =
        [ ((Left, Front, Up), (White, Orange, Blue)),
          ((Left, Back, Up), (Green, Yellow, Red)),
          ((Right, Front, Up), (Red, Yellow, Blue)),
          ((Right, Back, Up), (White, Blue, Red)),
          ((Left, Front, Down), (Green, Orange, Yellow)),
          ((Left, Back, Down), (Blue, Orange, Yellow)),
          ((Right, Front, Down), (Green, White, Red)),
          ((Right, Back, Down), (Orange, Green, White))
        ],
      solution = []
    }

cubeRotated R' =
  Cube
    { edges =
        [ ((Front, Up), (Yellow, Orange)),
          ((Left, Up), (Orange, Green)),
          ((Back, Up), (Yellow, Green)),
          ((Right, Up), (White, Green)),
          ((Left, Front), (Red, Blue)),
          ((Left, Back), (Blue, Yellow)),
          ((Right, Back), (Orange, White)),
          ((Right, Front), (Red, Yellow)),
          ((Front, Down), (Red, White)),
          ((Left, Down), (Red, Green)),
          ((Back, Down), (Blue, Orange)),
          ((Right, Down), (Blue, White))
        ],
      corners =
        [ ((Left, Front, Up), (White, Orange, Blue)),
          ((Left, Back, Up), (Green, Yellow, Red)),
          ((Right, Front, Up), (Orange, Green, White)),
          ((Right, Back, Up), (Green, White, Red)),
          ((Left, Front, Down), (Green, Orange, Yellow)),
          ((Left, Back, Down), (Blue, Orange, Yellow)),
          ((Right, Front, Down), (White, Blue, Red)),
          ((Right, Back, Down), (Red, Yellow, Blue))
        ],
      solution = []
    }

-- when
testCube :: Rotation -> Bool
testCube rot = edges actual == edges expected && corners actual == corners expected
    where
        actual = rotateCube rot exampleCube
        expected = cubeRotated rot

-- then
testAllRotations =
    all testCube [F, F', B, B', U, U', D, D', L, L', R, R']


-- Run tests --
runTest fn name = do
    putStr (name ++ ": ")
    putStrLn $ if fn then "PASS" else "FAIL"

main = do
    runTest testAllRotations "Test all single rotations"
