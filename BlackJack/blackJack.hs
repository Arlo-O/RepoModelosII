import System.Random.Shuffle (shuffleM)
import System.Random (newStdGen)

putStrLn :: String -> IO()
-- Función principal del ciclo del juego
cicloJuego :: [String] -> [String] -> [String] -> IO ([String], [String], [String])
cicloJuego [] [] [] = do
    baraja <- shuffleM crearBaraja  -- Mezclar la baraja
    let manoJugador = []
        manoDealer = []
    (barajaActual, manoJugador', manoDealer') <- repartirCartas baraja
    juego barajaActual manoJugador' manoDealer'
cicloJuego l1 l2 l3 = juego l1 l2 l3

-- Función auxiliar que maneja el flujo del juego
juego :: [String] -> [String] -> [String] -> IO ([String], [String], [String])
juego baraja manoJugador manoDealer = do
    -- Turno del jugador
    (baraja', manoJugador') <- turnoJugador baraja manoJugador
    
    -- Comprobar el puntaje del jugador
    when (calcularPuntaje manoJugador' <= 21) $ do
        -- Turno del dealer
        (baraja'', manoDealer') <- turnoDealer baraja' manoDealer
    
        -- Mostrar la mano del dealer y su puntaje
        putStrLn $ "Mano del dealer: " ++ show manoDealer' ++ ", su puntaje es: " ++ show (calcularPuntaje manoDealer')
        
        -- Mostrar el resultado del juego
        putStrLn $ resultado manoJugador' manoDealer'
    
    return (baraja', manoJugador', manoDealer)

crearBaraja :: [(String, String)]
crearBaraja = [(v, s) | v <- valores, s <- simbolos]
    where
        simbolos = ["Corazones", "Diamantes", "Tréboles", "Picas"]
        valores = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

repartirCartas :: [(String, String)] -> IO ([String],[String],[String])
repartirCartas baraja = do
    barajaMezclada <- shuffleM baraja
    let (manoJugador, manoDealer) = foldr (\c (j,d) -> (c:j, d)) ([], []) (take 4 barajaMezclada)
    return (drop 4 barajaMezclada, manoJugador, manoDealer)

calcularPuntaje :: [String] -> Int
calcularPuntaje mano = 
    let tieneAs = elem "A" mano
        conteo = conteoMano mano
    in if tienesAs && conteo < 11
        then conteo + 10
        else conteo

conteoMano :: [String] -> Int
conteoMano [] = 0
conteoMano (carta:mano) = valorCarta carta + conteoMano mano

valorCarta :: String -> Int
valorCarta carta
    | carta == "A" = 1
    | carta `elem` ["J", "Q", "K"] = 10
    | otherwise = read carta :: Int

turnoJugador :: [(String, String)] -> [String] -> IO ([(String, String)], [String])
turnoJugador baraja manoJugador = do
    let puntaje = calcularPuntaje manoJugador
    if puntaje >= 21
        then return (baraja, manoJugador)
    
    putStrLn $ "Su mano es: " ++ show manoJugador ++ ", con un valor de: " ++ show puntaje
    putStrLn "¿Quiere pedir una carta o plantarse?: "
    decision <- getLine

    if map toLower (strip decision) == "pedir"
        then do
            let nuevaCarta = fst (head baraja)  -- Obtener la carta de la parte superior de la baraja
            let nuevaBaraja = tail baraja  -- Actualizar la baraja eliminando la carta pedida
            let nuevaMano = manoJugador ++ [nuevaCarta]  -- Añadir la nueva carta a la mano
            turnoJugador nuevaBaraja nuevaMano  -- Llamada recursiva
        else
            return (baraja, manoJugador)
            
turnoDealer :: [(String, String)] -> [String] -> IO ([(String, String)], [String])
turnoDealer baraja manoDealer = do
    let puntaje = calcularPuntaje manoDealer
    if puntaje >= 18
        then return (baraja, manoDealer)

    let nuevaCarta = fst (head baraja)  -- Obtener la carta de la parte superior de la baraja
    let nuevaBaraja = tail baraja  -- Actualizar la baraja eliminando la carta pedida
    let nuevaMano = manoDealer ++ [nuevaCarta]  -- Añadir la nueva carta a la mano del dealer
    turnoDealer nuevaBaraja nuevaMano  -- Llamada recursiva

resultado :: [String] -> [String] -> String
resultado manoJugador manoDealer =
    let puntajeJugador = calcularPuntaje manoJugador
        puntajeDealer = calcularPuntaje manoDealer
    in if puntajeJugador > 21
       then "Se pasó, puntaje: " ++ show puntajeJugador ++ ", perdió, su mano era: " ++ show manoJugador
       else if puntajeDealer > 21 || puntajeJugador > puntajeDealer
            then "Ha ganado, con un puntaje de: " ++ show puntajeJugador ++ " sobre el dealer con puntaje " ++ show puntajeDealer
            else if puntajeJugador == puntajeDealer
                 then "Ha sido empate, su mano era: " ++ show manoJugador
                 else "Perdió con un puntaje de " ++ show puntajeJugador ++ " contra " ++ show puntajeDealer


main :: IO ()
main = do
    (barajaRestante, manoJugador, manoDealer) <- cicloJuego [] [] []
    print manoJugador

