xor1  :: Bool -> Bool  -> Bool
xor1  x y = (/=)x y
main = do
   print( xor1   True False)
