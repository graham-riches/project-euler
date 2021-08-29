import Data.List
import Data.Bool

getNumFactors :: Int -> Int
getNumFactors n = 2 * length [x | x <- [1..maxFactor], n `mod` x == 0]
   where maxFactor = getTruncSqrt n

getBaseFactors :: Int -> [Int]
getBaseFactors n = [x | x <- [1..maxFactor], n `mod` x == 0]
   where maxFactor = getTruncSqrt n

getFactors :: Int -> [(Int, Int)]
getFactors n = zip a b
   where a = getBaseFactors n
         b = map (\x -> n `div` x) a

getTruncSqrt :: Int -> Int
getTruncSqrt n = floor $ sqrt $ fromIntegral n

toDigits :: Int -> [Int]
toDigits = reverse . unfoldr getDigit
   where getDigit 0 = Nothing
         getDigit n = let (q, r) = n `quotRem` 10 in Just(r, q)

allElementsUnique list = case list of
   [] -> True
   (x:xs) -> if x `elem` xs then False else allElementsUnique xs

isPandigital :: Int -> Bool
isPandigital n = allElementsUnique (toDigits n)

listMerge :: [a] -> [a] -> [a]
listMerge xs [] = xs
listMerge [] ys = ys
listMerge (x:xs) (y:ys) = x : y : listMerge xs ys

getPandigitalFactors :: Int -> [(Int, Int)]
getPandigitalFactors n = [factors | factors <- getFactors n, allElementsUnique $ listMerge (toDigits $ fst factors) (toDigits $ snd factors)]

is19Pandigital n = (length containedValues == 9) && (length n == 9)
   where containedValues = [a | a <- [1..9], a `elem` n]

isPandigitalSet :: Int -> Int -> Int -> Bool
isPandigitalSet a b c = is19Pandigital $ listMerge (toDigits a) $ listMerge (toDigits b) (toDigits c)

checkPandigitalSet c = case factors of [] -> False
                                       f -> inner c f
   where factors = getPandigitalFactors c
         inner n f = case f of [] -> False
                               (x:xs) -> if isPandigitalSet n (fst x) (snd x) then True else inner n xs

allPandigitals = [a | a <- [1..9876], isPandigital a]

pandigitalSum = [a * b | a <- allPandigitals, b <- allPandigitals, isPandigitalSet a b (a*b)]