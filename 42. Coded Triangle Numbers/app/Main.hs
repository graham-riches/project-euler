module Main where

import System.IO
import Control.Monad
import Data.Char
import Data.Map (Map)
import qualified Data.Map as Map


main :: IO ()
main = do
    contents <- readFile "words.txt"    
    let words = split contents ','
    let values = map getWordValue words    
    let series = generateTriangleNumberSeries (foldl max 0 values)
    let count = foldl (+) 0 (map (\x -> fromEnum(elem x series)) values)
    putStrLn (show count)

printInt x = putStrLn (show x)

generateTriangleNumber :: Int -> Int
generateTriangleNumber n = n * (n + 1) `div` 2

generateTriangleNumberSeries :: Int -> [Int]
generateTriangleNumberSeries n = generateHelper 1 n []
    where
    generateHelper :: Int -> Int -> [Int] -> [Int]
    generateHelper ind max out
        | val <= max = generateHelper (ind + 1) max (val:out)
        | otherwise = out
        where
            val = generateTriangleNumber ind


makeMap :: Map Char Int
makeMap = Map.fromList (zip ['A'..'Z'][1..])

getCharValue :: Char -> Int
getCharValue n = Map.findWithDefault 0 n makeMap

getWordValue :: [Char] -> Int
getWordValue word = foldl (\acc y -> acc + getCharValue y) 0 word

split :: String -> Char -> [String]
split [] delim = [""]
split (c:cs) delim
    | c == delim = "" : rest
    | otherwise = (c : head rest) : tail rest
    where 
        rest = split cs delim
