import System.CPUTime
import System.Environment

-- Frpm: https://rosettacode.org/wiki/Linear_congruential_generator#Haskell
-- rand() function from BSD libc
-- This version is very short as it 'hides' an argument 
-- using eta reduction and function composition with the dot (.) operator 
-- See more about this on: 
-- https://wiki.haskell.org/Eta_conversion
-- https://melkornemesis.medium.com/haskell-explained-3f91658a67d3
-- https://tgdwyer.github.io/haskell3/
bsd = tail . iterate (\n -> (n * 1103515245 + 12345) `mod` 2^31)

-- Let's rewrite bsd without eta reduction
lcg1 :: Integer -> [Integer]
lcg1 s = tail $ iterate (\n -> (n * 1103515245 + 12345) `mod` 2^31) s

-- rand() function from the Microsoft C Runtime (MSCVRT.DLL). 
msr = map (`div` 2^16) . tail . iterate (\n -> (214013 * n + 2531011) `mod` 2^31)

-- Let's also rewrite msr without eta reduction
lcg2 :: Integer -> [Integer]
lcg2 s = map (`div` 2^16) $ tail $ iterate (\n -> (214013 * n + 2531011) `mod` 2^31) s



-- This main function will get arguments from the command line, 
-- so you have to open a terminal and run the program using runhaskell:
-- runhaskell lcgexample.hs <n> <s>
-- For example, this will generate 10 numbers using 1 as a seed
-- runhaskell lcgexample.hs 10 1
main :: IO()
main = do
  args <- getArgs
  let n = read $ args !! 0 -- read converts from String 
      s = read $ args !! 1
  print $ take n $ lcg1 s

-- This alternative main function will get CPUTime as a seed
-- and will generate a fixed amount of numbers (10)
main' :: IO()
main' = do
  seed <- getCPUTime
  let randoms1 = take 10 $ lcg1 (seed) 
  print randoms1
  let randoms2 = take 10 $ lcg2 (seed)
  print randoms2
  -- print $ take 10 $ lcg1 (seed) 
  -- print $ take 10 $ lcg2 (seed)
