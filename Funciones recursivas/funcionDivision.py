def dividirDeclarativa(dividendo : float, divisor : float, precision: int):
    if dividendo < divisor:
        if precision == 0:
            return 0
        return 0.1 * (dividirRecursiva(dividendo*10-divisor, divisor, precision -1) + 1)
    if divisor >= divisor:
        return dividirRecursiva(dividendo-divisor, divisor, precision) + 1
    

def dividirImperativa(dividendo : float, divisor : float) -> float:
    precision = 10
    cociente = 0
    while dividendo >= divisor: #Parte entera de la división
        dividendo -= divisor
        cociente += 1
        if (dividendo - divisor) == 0:
            return cociente
    decimales = 0
    dividendo *= 10
    while dividendo >= divisor:
        precision -=1
        dividendo -= divisor
        decimales += 1
        if precision == 0:
            break
    
    decimales *= 0.1
    
    return cociente + decimales

print(dividirDeclarativa(20, 3))

print(dividirRecursiva(20, 3, 10))

    
