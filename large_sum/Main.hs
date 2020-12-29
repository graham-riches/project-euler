module Main where
import System.Environment
import Data.List



main :: IO ()
main = do
  inputData <- readFile "input.txt"
  let items = words inputData
  let ints = map read items :: [Integer]
  let total =  sum ints
    
  putStrLn "Total Value: "
  print total

  let chars = take 10 $ show total
  putStrLn chars
