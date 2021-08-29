module Main where
import Data.Sort
import Data.List.Split
import Data.HashMap.Strict as HashMap
import Control.Monad


getNameScore :: [Char] -> Integer
getNameScore a = sum $ Prelude.map (\x -> HashMap.findWithDefault 0 x dict) a
    where dict = HashMap.fromList $ zip ['A'..'Z'] [1..26]

main :: IO ()
main = do
    inputData <- readFile "names.txt"
    let items = sort . splitOn "," $ Prelude.filter(/='\"') inputData
    let scores = Prelude.map getNameScore items
    let total = sum $ zipWith (*) scores [1..toInteger(length scores)]    
    print total