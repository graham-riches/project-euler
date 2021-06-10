import Data.List
import Data.Bool
import Data.Ratio

isCurious :: Integer -> Integer -> Integer -> Bool
isCurious n d i = ((10*n + i) % (10* i + d)) == (n%d)

result = product [n % d | n<-[1..9], d<-[1..9], i<-[1..9], isCurious n d i, n /= d && n /= i]