module Main where

import Data.Char
import System.IO
import Data.Bits

main = readSequences "input.txt"

readSequences :: FilePath -> IO ()
readSequences fp =
    do l <- readFile fp
       mapM_ (\s -> putStr (id (getStringFromSequence s))) (lines l)
       putStrLn ""

getStringFromSequence :: String -> String
getStringFromSequence s = [getCharFromPosition x y]
    where
        (x, y) = moveFinger s (bit 0) (bit 2) :: (Integer, Integer)

getCharFromPosition :: Bits a => a -> a -> Char
getCharFromPosition x y = (keypad !! (bitToOffset y)) !! (bitToOffset x)

bitToOffset :: Bits a => a -> Int
bitToOffset b | testBit b 0 = 0
              | testBit b 1 = 1
              | testBit b 2 = 2
              | testBit b 3 = 3
              | testBit b 4 = 4
              | otherwise   = 0

keypad :: [[Char]]
keypad = ["  1  ",
          " 234 ",
          "56789",
          " ABC ",
          "  D  "]


moveFinger :: Bits a => String -> a -> a -> (a, a)
moveFinger [] x y                     = (x, y)

moveFinger ('U':bs) x y | testBit y 0                                       = moveFinger bs x y
                        | (testBit y 1) && ((testBit x 1) || (testBit x 3)) = moveFinger bs x y
                        | (testBit y 2) && ((testBit x 0) || (testBit x 4)) = moveFinger bs x y
                        | otherwise                                         = moveFinger bs x (shiftR y 1)


moveFinger ('D':bs) x y | testBit y 4                                       = moveFinger bs x y
                        | (testBit y 3) && ((testBit x 1) || (testBit x 3)) = moveFinger bs x y
                        | (testBit y 2) && ((testBit x 0) || (testBit x 4)) = moveFinger bs x y
                        | otherwise                                         = moveFinger bs x (shiftL y 1)


moveFinger ('L':bs) x y | testBit x 0                                       = moveFinger bs x y
                        | (testBit x 1) && ((testBit y 1) || (testBit y 3)) = moveFinger bs x y
                        | (testBit x 2) && ((testBit y 0) || (testBit y 4)) = moveFinger bs x y
                        | otherwise                                         = moveFinger bs (shiftR x 1) y


moveFinger ('R':bs) x y | testBit x 4                                       = moveFinger bs x y
                        | (testBit x 3) && ((testBit y 1) || (testBit y 3)) = moveFinger bs x y
                        | (testBit x 2) && ((testBit y 0) || (testBit y 4)) = moveFinger bs x y
                        | otherwise                                         = moveFinger bs (shiftL x 1) y


moveFinger (b:bs) x y                                                       = moveFinger bs x y