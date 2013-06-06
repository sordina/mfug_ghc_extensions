{-# LANGUAGE GADTs #-}

data Expr = I Int
          | B Bool           -- boolean constants
          | Add Expr Expr
          | Mul Expr Expr
          | Eq  Expr Expr    -- equality test

-- | This looks good, but what will our eval function look like?

eval (I n)          = Left n
eval (B b)          = Right b
-- eval (Add e1 e2) = eval e1 + eval e2  -- ???
