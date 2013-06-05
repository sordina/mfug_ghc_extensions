{-# LANGUAGE MultiParamTypeClasses #-}

data Quux

-- Vanilla
class Foo a
instance Foo Quux

-- Multi Param
class Bar a b
instance Bar Quux Quux
