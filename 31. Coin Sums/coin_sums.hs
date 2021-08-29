import Data.List
import Data.Hashmap.Strict as HashMap


coins::[Integer]
coins = [1, 2, 5, 10, 20, 50, 100, 200]



combinationsTo :: Integer -> [Integer] -> Integer
combinationsTo 0 [] = 1
combinationsTo n coins = 1
   where dict = HashMap.fromList $ zip (cycle 1) [1..200]