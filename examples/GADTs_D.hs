{-# LANGUAGE GADTs #-}

data Expr x =         I Int
            |         B Bool
            |         Add (Expr Int) (Expr Int)
            |         Mul (Expr Int) (Expr Int)
            | Eq x => Eq  (Expr x)   (Expr x)

-- This looks good, but...

eval :: Expr a -> a
eval (I i)    = i

-- ... this doesn't unify because GHC doesn't know that (I 1 :: Expr Int), etc.
