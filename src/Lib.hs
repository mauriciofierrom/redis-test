{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Database.Redis.IO
import System.Logger

add :: Key -> Field -> Redis IO Bool
add k f = set k f nx

getLogger :: IO Logger
getLogger = create StdOut

getPool :: IO Pool
getPool = do
  logger <- getLogger
  mkPool logger Database.Redis.IO.defSettings
