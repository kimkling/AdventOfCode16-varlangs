module Main where

import Data.Char
import System.IO
import Data.Bits

main = readSequences "input.txt"

readSequences :: FilePath -> IO ()
readSequences fp =
    do l <- readFile fp
       mapM_ (\s -> putStr (show (getDigitFromSequence s))) (lines l)
       putStrLn ""

getDigitFromSequence :: String -> Integer
getDigitFromSequence s = (((bitToOffset y) - 1) * 3) + (bitToOffset x)
    where
        (x, y) = moveFinger s (bit 1) (bit 1) :: (Integer, Integer)

bitToOffset :: Bits a => a -> Integer
bitToOffset b | testBit b 0 = 1
              | testBit b 1 = 2
              | testBit b 2 = 3
              | otherwise   = 0

moveFinger :: Bits a => String -> a -> a -> (a, a)
moveFinger [] x y                     = (x, y)
moveFinger ('U':bs) x y | testBit y 0 = moveFinger bs x y
                        | otherwise   = moveFinger bs x (shiftR y 1)
moveFinger ('D':bs) x y | testBit y 2 = moveFinger bs x y
                        | otherwise   = moveFinger bs x (shiftL y 1)
moveFinger ('L':bs) x y | testBit x 0 = moveFinger bs x y
                        | otherwise   = moveFinger bs (shiftR x 1) y
moveFinger ('R':bs) x y | testBit x 2 = moveFinger bs x y
                        | otherwise   = moveFinger bs (shiftL x 1) y
moveFinger (b:bs) x y                 = moveFinger bs x y