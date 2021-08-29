import Data.List
import Data.Ord

isPrime :: Int -> Bool
isPrime n =  (n > 1) && null [x | x <- [2..n-1], n `mod` x == 0]

quadraticPrimeLength:: Int -> Int -> Int
quadraticPrimeLength a b = length $ takeWhile isPrime [n^2 + a*n +b | n <- [0..]]


p27 = uncurry (*) elem
    where elem = snd $ maximumBy (comparing fst) $ zip quadLength coeffs 
          coeffs = [(a, b) | a <- [-999 .. 999], b <- [-1000 .. 1000]]
          quadLength = map (uncurry quadraticPrimeLength) coeffs