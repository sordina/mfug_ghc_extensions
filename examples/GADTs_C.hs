{-# LANGUAGE GADTs #-}

data BoolExpr = EqInt  IntExpr  IntExpr | EqBool BoolExpr BoolExpr

data IntExpr = I Int | Add IntExpr IntExpr | Mul IntExpr IntExpr

type Expr = Either BoolExpr IntExpr

eval :: Expr -> Either Bool Int
eval (Left  ex) = Left  (evalBool ex)
eval (Right ex) = Right (evalInt  ex)

evalBool :: BoolExpr -> Bool
evalBool (EqInt  ex1 ex2) = evalInt  ex1 == evalInt  ex2
evalBool (EqBool ex1 ex2) = evalBool ex1 == evalBool ex2

evalInt :: IntExpr -> Int
evalInt (I   i  ) = i
evalInt (Add x y) = evalInt x + evalInt y
evalInt (Mul x y) = evalInt x * evalInt y

test :: IO () -- (6 = 2x3) = (2+2 = 2x2)
test = print (eval (Left (EqBool (EqInt (I 6)             (Mul (I 2) (I 3)))
                                 (EqInt (Add (I 2) (I 2)) (Mul (I 2) (I 2))))))
