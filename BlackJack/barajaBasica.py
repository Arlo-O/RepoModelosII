import random
baraja = []
manoJugador = []

def cicloJuego(baraja = None, manoJugador= None, manoDelaer= None):
    if baraja is None:
        baraja = crearBaraja()
        random.shuffle(baraja)
        manoJugador, manoDelaer = [] , []

    if len(manoJugador) == 0 and len(manoDelaer) == 0:
        baraja, manoJugador, manoDelaer = repartirCartas(baraja,manoJugador,manoDelaer)
    
    baraja, manoJugador = turnoJugador(baraja, manoJugador)
    if calcularPuntaje(manoJugador) <= 21:
        baraja, manoDelaer, = turnoDealer(baraja, manoDelaer)
    
    print(f"Mano del dealer: {manoDelaer}, su puntaje es: {calcularPuntaje(manoDelaer)}")
    print(resultado(manoJugador, manoDelaer))

def resultado(manoJugador:list, manoDealer:list):
    if calcularPuntaje(manoJugador) > 21:
        return f"Se paso, puntaje: {calcularPuntaje(manoJugador)}, perdío, su mano era: {manoJugador}"
    elif calcularPuntaje(manoDealer) > 21 or calcularPuntaje(manoJugador) > calcularPuntaje(manoDealer):
        return f"Ha ganado, con un puntaje de : {calcularPuntaje(manoJugador)} sobre el dealer con puntaje {calcularPuntaje(manoDealer)}"
    elif calcularPuntaje(manoJugador) == calcularPuntaje(manoDealer):
        return f"Ha sido empate, su mano era: {manoJugador}"
    else:
        return f"Perdió con un puntaje de {calcularPuntaje(manoJugador)} contra {calcularPuntaje(manoDealer)}"

def turnoDealer(baraja:list, manoDealer:list):
    if calcularPuntaje(manoDealer) >= 18:
        return baraja, manoDealer
    
    manoDealer.append(baraja.pop())
    return turnoDealer(baraja, manoDealer)

def turnoJugador(baraja:list, manoJugador:list):
    if calcularPuntaje(manoJugador) >= 21:
        return baraja, manoJugador
    
    if (input(f"Su mano es: {manoJugador}, con un valor de: {calcularPuntaje(manoJugador)}, ¿Quiere pedir una carta o plantarse?: ").strip().lower()) == 'pedir':
        manoJugador.append(baraja.pop())
        return turnoJugador(baraja, manoJugador)
    else:
        return baraja, manoJugador

def repartirCartas(baraja:list, manoJugador:list, manoDelaer:list):
    manoJugador.append(baraja.pop())
    manoDelaer.append(baraja.pop())
    manoJugador.append(baraja.pop())
    manoDelaer.append(baraja.pop())
    return baraja, manoJugador, manoDelaer

def calcularPuntaje(mano:list) -> int:
    if 'A' in mano and conteoMano(mano) <=11:
        return conteoMano(mano) + 10
    return conteoMano(mano)

def crearBaraja() -> list:
    simbolos = ["Corazones", "Diamantes", "Tréboles", "Picas"]
    valores = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    return [(v, s) for v in valores for s in simbolos]

def valorCarta( valor : str) -> int:
    if valor in ('J', 'Q', 'K'):
        return 10
    elif valor == 'A':
        return 1
    else:
        return int(valor)

def conteoMano(baraja : list) -> int:
    if baraja == []:
        return 0
    return valorCarta(baraja[0][0]) + conteoMano(baraja[1:])

cicloJuego()