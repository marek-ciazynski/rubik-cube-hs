module Utils where

import Prelude hiding (Left, Right)


splitByPredicate :: (a -> Bool) -> [a] -> ([a], [a])
splitByPredicate p [] = ([], [])
splitByPredicate p (x:xs)
    | p x = ([], xs)
    | otherwise = (x : before, after)
        where
            (before, after) = splitByPredicate p xs
