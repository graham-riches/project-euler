import Data.List
import Data.Ord

collatzLength :: Int -> Int 
collatzLength 1 = 1
collatzLength n = 1 + collatzLength x
    where x = if even n then n `div` 2 else 3*n + 1