{-# LANGUAGE MonadComprehensions #-}

result :: Maybe Integer
result = [ x + y | x <- Just 1, y <- Just 2 ]

main :: IO ()
main = print result
