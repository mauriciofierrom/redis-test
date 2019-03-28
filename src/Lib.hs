{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}

module Lib where

import Database.Redis.IO
import System.Logger
import qualified Data.ByteString.Lazy as B

add :: Key -> Field -> Redis IO Bool
add k f = set k f nx

lookup :: Key -> Redis IO B.ByteString
lookup k =
  get k >>= \case
    Just s -> return s
    Nothing -> error "That shit sucks"

getLogger :: IO Logger
getLogger = create StdOut

getPool :: IO Pool
getPool = do
  logger <- getLogger
  mkPool logger Database.Redis.IO.defSettings
