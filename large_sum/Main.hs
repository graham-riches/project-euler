module Main where
import System.Environment
import Data.List



main :: IO ()
main = do
  inputData <- readFile "input.txt"
  let items = words inputData
  let ints = map read items :: [Integer]  
  print $ take 10 $ show $ sum ints
