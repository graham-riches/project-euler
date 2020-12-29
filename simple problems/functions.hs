import Data.List
import Data.Numbers.Primes


multiplesThreeFive :: Int -> Int
multiplesThreeFive a | a `mod` 3 == 0 = a 
                     | a `mod` 5 == 0 = a
                     | otherwise  = 0        


fibonacci :: Int -> Int
fibonacci 0 = 1
fibonacci n = n + fibonacci(n-1)


fibonacciLessThan :: Int -> [Int]
fibonacciLessThan n = takeWhile (<= n) fibs
   where fibs = 0 : 1 : zipWith (+) fibs (tail fibs)


getEvens :: [Int] -> [Int]
getEvens = filter even


primeFactors' :: Int -> [Int]
primeFactors' n = 
   case factors of
      [] -> [n]
      _  -> factors ++ primeFactors(n `div` (head factors))
      where factors = take 1 $ filter(\x -> (n `mod` x) == 0)[2 .. n-1]


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