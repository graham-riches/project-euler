import Data.List

-- number spirals are just a special repeating list sum where each diagonal has a separate unique pattern

-- creates an infinite list following the left diagonal pattern, which is just a scan summing the list of
-- even numbers into the start value
leftDiagonal :: [Integer]
leftDiagonal = scanl (+) 1 [x | x <- [1..], even x]

-- creates an infinite list following the right diagonal pattern, which is a scan summing the list of repeating 
-- multiples of 4 --> [4,4,8,8,12,12,16,16,20,20,..]
rightDiagonal :: [Integer]
rightDiagonal = scanl (+) 1 xs
    where xs = concatMap (replicate 2) [x*4 | x <- [1..]]


