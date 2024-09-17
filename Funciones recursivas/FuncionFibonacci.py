def Fibonacci(n):
    if 2>n:
        if 1==n:
            return 1
        else:
            return 0
    else:
        return Fibonacci(n-1)+Fibonacci(n-2)

print("ingresar el numero de secuencia para la funcion de fibonacci")
print(Fibonacci(int(input())))