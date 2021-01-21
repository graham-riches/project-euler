import Data.List


toDigits :: Integer -> [Integer]
toDigits = reverse . unfoldr getDigit
   where getDigit 0 = Nothing
         getDigit n = let (q, r) = n `quotRem` 10 in Just(r, q)


fifthPowerSum :: [Integer] -> Integer
fifthPowerSum [] = 0
fifthPowerSum xs = sum $ map (^5) xs


problem30 :: Integer
problem30 = sum $ map snd $ filter (uncurry (==)) $ zip ys xs
    where
        xs = [2..limits]
        ys = map (fifthPowerSum . toDigits) xs
        limits = fst $ head $ dropWhile (uncurry (<)) $ zip [10^x | x <- [1..]] [x*(9^5) | x <- [1..]]
