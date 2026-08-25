{-# LANGUAGE CPP #-}
{-# LANGUAGE GHC2021 #-}
{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE LexicalNegation #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE NPlusKPatterns #-}
{-# LANGUAGE DataKinds, NoStarIsType, TypeFamilyDependencies, UndecidableInstances #-}
{-# LANGUAGE OverloadedStrings #-}
module Main 
    ( main
    ) where

import Data.ByteString.Char8 qualified as B
import Data.Maybe

import Debug.Trace qualified as Debug

{- $setup
>>> :set -XOverloadedStrings
-}
_debug :: Bool
_debug = () /= ()

type I = Int
type O = Int

type Dom   = ()
type Codom = ()

type Solver = Dom -> Codom

solve :: Solver
solve = \ case
    () -> ()

decode :: [[I]] -> Dom
decode = \ case
    _:_ -> ()
    _   -> _invalid $ "decode: " ++ show @Int __LINE__

encode :: Codom -> [[O]]
encode = \ case
    _rr -> [[]]

main :: IO ()
main = B.interact (detokenize . encode . solve . decode . entokenize)

entokenize :: AsToken a => B.ByteString -> [[a]]
entokenize = map (map toToken . B.words) . B.lines

detokenize :: AsToken a => [[a]] -> B.ByteString
detokenize = B.unlines . map (B.unwords . map fromToken)

class AsToken a where
    toToken :: B.ByteString -> a
    fromToken :: a -> B.ByteString
    
instance AsToken B.ByteString where
    toToken :: B.ByteString -> B.ByteString
    toToken = id
    fromToken :: B.ByteString -> B.ByteString
    fromToken = id

instance AsToken Int where
    toToken :: B.ByteString -> Int
    toToken = fst . fromJust . B.readInt
    fromToken :: Int -> B.ByteString
    fromToken = B.pack . show

instance AsToken Integer where
    toToken :: B.ByteString -> Integer
    toToken = fst . fromJust . B.readInteger
    fromToken :: Integer -> B.ByteString
    fromToken = B.pack . show

instance AsToken String where
    toToken :: B.ByteString -> String
    toToken = B.unpack
    fromToken :: String -> B.ByteString
    fromToken = B.pack

instance AsToken Double where
    toToken :: B.ByteString -> Double
    toToken = read . B.unpack
    fromToken :: Double -> B.ByteString
    fromToken = B.pack . show

{- debug -}
_trace :: String -> a -> a
_trace | _debug    = Debug.trace
       | otherwise = const id

_tracing :: Show a => a -> a
_tracing = _trace . show <*> id

{- error -}
_impossible :: String -> a
_impossible msg = error $ msg ++ ": impossible"

_invalid :: String -> a
_invalid msg = error $ msg ++ ": invalid input"

{- Start of Bonsai -}

{- End of Bonsai -}
{- Kluges -}

{- End of Kluges -}
