def potenciaRecursiva(base : int, exponente : int):
    if exponente == 0:
        return 1
    elif exponente == 1:
        return base
    
    elif exponente > 0:
        return base * potenciaRecursiva(base, exponente-1)
    
    else: 
        return 1/(potenciaRecursiva(base, -exponente))

print(potenciaRecursiva(2, 3))
print(potenciaRecursiva(5, -2))
print(potenciaRecursiva(7, 0))

def potenciaDeclarativa(base:int, exponente:int):
    if exponente == 0:
        return 1
    elif exponente < 0:
        base = 1 / base
        exponente = -exponente

    resultado = 1
    while exponente > 0:
        resultado *= base
        exponente -= 1

    return resultado

print(potenciaDeclarativa(2, 3))
print(potenciaDeclarativa(5, -2))
print(potenciaDeclarativa(7, 0))