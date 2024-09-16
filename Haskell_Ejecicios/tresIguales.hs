tresIguales :: Int -> Int ->Int -> Bool
tresIguales x y z= (==) x y &&(==)x z &&(==)y z
main = do
   print( tresIguales 3 3 2)
