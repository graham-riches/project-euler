import Data.List

digitFactorials = map factorial [0..9]


toDigits :: Int -> [Int]
toDigits = reverse . unfoldr getDigit
   where getDigit 0 = Nothing
         getDigit n = let (q, r) = n `quotRem` 10 in Just(r, q)

factorial :: Int -> Int
factorial n = product[1..n]

getFactorial n = digitFactorials !! n

isFactorialSum :: Int -> Bool
isFactorialSum n = (sum $ map getFactorial $ toDigits n) == n

digitFactorialSum = sum [a | a <- [3..(7 * factorial 9)], isFactorialSum a]