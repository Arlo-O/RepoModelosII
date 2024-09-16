def  multiplicar_recursivamente(a,b,c):
    """aqui describe la realizacion de """
    if b==c:
        return a
    return a+multiplicar_recursivamente(a,b,c+1)
print("ingrese los valores a multiplicar")    
print("el valor de la multiplicacion es",multiplicar_recursivamente(int(input()),int(input()),0))