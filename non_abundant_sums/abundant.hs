import Data.List

divisorSum :: Int -> Int
divisorSum n = sum $ [x | x <- [1..(n `div` 2)], n `mod` x == 0]

t = 28123

abundantNumbers = filter (\(x, y) -> y > x) $ zip [1..t] (map divisorSum [1..t])