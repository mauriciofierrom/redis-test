{-# LANGUAGE OverloadedStrings #-}

module Main where

import Database.Redis.IO

import Lib
import Data.Bool (bool)

main :: IO ()
main = do
  pool <- getPool
  res <- runRedis pool (commands s)
  putStrLn (line res)
    where
      s :: Redis IO Bool
      s = add "key" "value"

      line :: Bool -> String
      line = bool "error" "Yeah!"
