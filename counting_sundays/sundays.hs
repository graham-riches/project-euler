import Data.List

normalYear = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

leapYear = 31 : 29 : drop 2 normalYear

daysPerWeek = [1..7] -- monday -> sunday, monday == 1

generateDays:: [Integer]
generateDays = concat $ replicate 4 normalYear ++ cycle(leapYear : replicate 3 normalYear)


firstOfMonth = scanl (\x y -> (x+y) `mod` 7) 1 generateDays

countSundays = length . filter (\x -> x == 0) . drop 12 . take 1212 $ firstOfMonth