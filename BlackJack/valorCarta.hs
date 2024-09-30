valorCarta :: (String, String) -> Int
valorCarta (numero, _) 
    | numero == "A" = 1
    | numero `elem` ["K", "Q", "J"] = 10
    | otherwise = read numero

valorMano :: [(String, String)] -> Int
valorMano mano = sum (map valorCarta mano)

ajustarValorConAs :: [(String, String)] -> Int
ajustarValorConAs mano = 
    let valor = valorMano mano
        tieneAs = elem ("A", "Corazones") mano || elem ("A", "Picas") mano || 
                  elem ("A", "Diamantes") mano || elem ("A", "Tréboles") mano
    in if tieneAs && valor <= 11
       then valor + 10
       else valor

main :: IO ()
main = do
    let mano = [("A", "Corazones"), ("7", "Diamantes"), ("3", "Picas")]
    print (ajustarValorConAs mano) 
