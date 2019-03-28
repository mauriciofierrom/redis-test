{-# LANGUAGE OverloadedStrings #-}

module Main where

import Prelude hiding (lookup)
import Database.Redis.IO
import qualified Data.ByteString.Lazy as B

import Lib
import Data.Bool (bool)

main :: IO ()
main = do
  pool <- getPool
  res <- runRedis pool (commands s)
  putStrLn (line res)
  res1 <- runRedis pool (commands l)
  print res1
    where
      s :: Redis IO Bool
      s = add "key" "value"

      l :: Redis IO B.ByteString
      l = lookup "key"

      line :: Bool -> String
      line = bool "error" "Saved!"
