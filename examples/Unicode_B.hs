{-# LANGUAGE UnicodeSyntax #-}

module Main where

data    Card = Card { rank :: Rank, suit :: Suit }   deriving (Eq, Ord)
data    Suit = Y :♠: Y | Y :♣: Y | Y :♦: Y | Y :♥: Y deriving (Show, Eq, Ord, Read)
data    Y    = Y                                     deriving (Show, Eq, Ord, Read)
