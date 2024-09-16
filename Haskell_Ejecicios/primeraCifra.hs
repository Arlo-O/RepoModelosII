primeraCifra :: Integer -> Integer
primeraCifra x = head (map (read . (:[])) (show (abs x)))
main = do
   print( primeraCifra   233)
