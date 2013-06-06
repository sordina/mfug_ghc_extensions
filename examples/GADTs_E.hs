{-# LANGUAGE GADTs #-}

data Expr a where
   I   ::         Int      -> Expr Int
   B   ::         Bool     -> Expr Bool
   Add ::         Expr Int -> Expr Int -> Expr Int
   Mul ::         Expr Int -> Expr Int -> Expr Int
   Eq  :: Eq a => Expr a   -> Expr a   -> Expr Bool

eval :: Expr a -> a
eval (I n) = n
eval (B b) = b
eval (Add e1 e2) = eval e1 +  eval e2
eval (Mul e1 e2) = eval e1 *  eval e2
eval (Eq  e1 e2) = eval e1 == eval e2

test :: IO ()
test = print (eval (Eq (Eq (I 2)             (Add (I 1) (I 1)))   -- 2 = 1+1
                       (Eq (Add (I 2) (I 2)) (Mul (I 2) (I 2))))) -- 2+2 = 2x2
