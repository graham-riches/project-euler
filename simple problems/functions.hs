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


primeFactors :: Int -> [Int]
primeFactors n = 
   case factors of
      [] -> [n]
      _  -> factors ++ primeFactors(n `div` (head factors))
      where factors = take 1 $ filter(\x -> (n `mod` x) == 0)[2 .. n-1]
