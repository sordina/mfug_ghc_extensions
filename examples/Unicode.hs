{-# LANGUAGE UnicodeSyntax #-}

(‽) :: Int -> Int -> Int
(‽) = max

main :: IO ()
main = print (1 ‽ 2)
