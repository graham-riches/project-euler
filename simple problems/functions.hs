import Data.List
import Data.Array
import Data.Numbers.Primes
import Data.Char


multiplesThreeFive :: Int -> Int
multiplesThreeFive a | a `mod` 3 == 0 = a 
                     | a `mod` 5 == 0 = a
                     | otherwise  = 0        


fibonacci :: Int -> Int
fibonacci 0 = 1
fibonacci n = n + fibonacci(n-1)

fibs :: [Integer]
fibs = 0:1:zipWith (+) fibs (tail fibs)

fibonacciLessThan :: Integer -> [Integer]
fibonacciLessThan n = takeWhile (<= n) fibs   

getEvens :: [Int] -> [Int]
getEvens = filter even


primeFactors' :: Int -> [Int]
primeFactors' n = 
   case factors of
      [] -> [n]
      _  -> factors ++ primeFactors(n `div` (head factors))
      where factors = take 1 $ filter(\x -> (n `mod` x) == 0)[2 .. n-1]


minElement :: [Int] -> Int 
minElement [n] = n
minElement (n:m) = if n < x then n else x
   where x = minElement m

remove :: Int -> [Int] -> [Int]
remove n (m:ms) = if n == m then ms else x
   where x = m : remove n ms

ssort :: [Int] -> [Int]
ssort [] = []
ssort [m] = [m]
ssort m = minimum : ssort remainder
   where minimum = minElement m
         remainder = remove minimum m

reverseInt :: Integral a => a -> a
reverseInt = go 0
   where go a 0 = a
         go a b = let(q, r) = b `quotRem` 10 in go(a*10 + r)q

reverseInt' :: Integer -> Integer
reverseInt' n = fromDigits $ reverse $ toDigits n


toDigits :: Integer -> [Integer]
toDigits = reverse . unfoldr getDigit
   where getDigit 0 = Nothing
         getDigit n = let (q, r) = n `quotRem` 10 in Just(r, q)


fromDigits :: [Integer] -> Integer
fromDigits = foldl useDigit 0
   where useDigit d m = m + d*10

isPalindrome :: Integer -> Bool
isPalindrome n = n == reverseInt' n

isPrime :: Int -> Bool
isPrime n =  (n > 1) && null [x | x <- [2..n-1], n `mod` x == 0]

triangleNumber :: Int -> Int
triangleNumber n = getSum n
   where getSum n = sum [0..n]


getNumFactors :: Int -> Int
getNumFactors n = 2 * length [x | x <- [1..maxFactor], n `mod` x == 0]
   where maxFactor = getTruncSqrt n

getTruncSqrt :: Int -> Int
getTruncSqrt n = floor $ sqrt $ fromIntegral n

stringToMatrix :: String -> (Int, Int) -> Array(Int, Int) Int
stringToMatrix input (x, y) = listArray ((1, 1), (x, y)) $ map read $ words input


ones = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
        "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
decas = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]


numberToString :: Int -> String
numberToString n 
    | n < 20 = ones!!(n - 1)
    | n >= 20 && n < 100 = decas!!(ten-2) ++ if one /= 0 then ones!!(one - 1) else ""
    | n >= 100 && n < 1000 = ones!!(cent-1) ++ "hundred" ++ if remainder /= 0 then  "and" ++ numberToString remainder else ""
    | n == 1000 = "onethousand"
    | otherwise = ""
    where (cent, remainder) = n `divMod` 100
          (ten, one) = n `divMod` 10


helloWorlds :: Int -> [String]
helloWorlds n = ["Hello World" | x <- [1..n]]

getOdds :: [Int] -> [Int]
getOdds lst = [x | (x, y) <- zip lst [1..n], odd y]
        where n = length lst

seriesExpansion :: Double -> Double
seriesExpansion n = 1 + sum [n^x / fromIntegral(factorial x) | x <- [1..9]]    

factorial :: Integer -> Integer
factorial n = product[1..n]

divisorSum :: Int -> Int
divisorSum n = sum $ [x | x <- [1..(n `div` 2)], n `mod` x == 0]

getAmicableNumbers :: [(Int, Int)] -> [Int]
getAmicableNumbers lst = [x | (x,y) <- lst, opposite x y == x, x /= y]
    where opposite x y = if y < length lst then snd $ lst !! y else -1
