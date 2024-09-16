mayorRectangulo :: (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer)
mayorRectangulo r1@(l1, a1) r2@(l2, a2)|l1*a1>= l2*a2=r1| otherwise=r2
main = do
   print( xor1   (4,6)(3,7))
