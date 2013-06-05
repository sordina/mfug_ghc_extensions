{-# LANGUAGE ParallelListComp #-}

result :: [ Integer ]
result = [ x + y | x <- [1 ..10]
                 | y <- [20..25] ]

main :: IO ()
main = print result
