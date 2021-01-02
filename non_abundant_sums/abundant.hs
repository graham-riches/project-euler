import Data.List

t = 28124

divisorSum :: Int -> Int
divisorSum n = sum $ [x | x <- [1..(n `div` 2)], n `mod` x == 0]

abundantNumbers :: [Int]
abundantNumbers = map fst $ filter (\(x, y) -> y > x) $ zip [1..t] (map divisorSum [1..t])
    

pairs :: [a] -> [(a, a)]
pairs l = [(x,y) | (x:ys) <- tails l, y <- ys] ++ [(x, x) | x <- l]

abundantSums :: [Int]
abundantSums = map (uncurry (+)) $ pairs abundantNumbers

problem23 = sum $ [x | x <- [1..t], x `notElem` abundantSums]