{-# LANGUAGE GADTs #-}

data Expr = I Int         -- integer constants
          | Add Expr Expr -- add two expressions
          | Mul Expr Expr -- multiply two expressions

-- You create an evaluation function in order to derive an integer from an expression:

eval :: Expr -> Int
eval (I n)       = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Mul e1 e2) = eval e1 * eval e2

-- This behaves as expected and everyone is happy:

prop_v1 :: Bool
prop_v1 = eval (Add (I 2) (I 2)) == 4

-- ... But ...
