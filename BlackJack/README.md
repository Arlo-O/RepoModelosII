# BLACKJACK
El juego de BLACKJACK consiste en que el jugador debe sumar las cartas hasta acercase lo mas posible al número 21 u obtener el número 21 y ganarle a dealer. Además, hay que tener en cuenta las siguientes reglas:
* El valor de los números es el numero de la carta.
* Las letras tienen un valor de 10.
* El A es ocasional, puede tener un valor de 1 o 11.
* Si se pasan de 21 pierde el juego automáticamente.
  
Entendiendo las reglas, Así podemos iniciar  el juego.Primero el jugador y dealer inician con dos cartas cada uno, 
después el jugador debe decidir si tomar más cartas o detenerse, cuando ya termine obtener las cartas deseadas debe 
voltear todas las cartas y el dealer debe superar el valor o igualar el valor para ganar, si  el dealer se pasa o no supera al jugador, 
el jugador ganara la partida.
# Funcionamiento del programa 
El programa recrea el funcionamiento del juego, pero la condición es uno a uno y las cartas se reinician con cada juego, 
así al momento de ejecutar el programa va mostrar tus cartas, debe decidir si plantase o seguir. Si desea pedir otra carta debe escribir “pedir” y si desea plantarse debe escribir “plantarse” o por definición el sistema tomará cualquier palabra diferente a "pedir" como el decidir plantarse. Después de plantase se mostrará la barraja del dealer y el resultado el ganador. 
Para el turno del Dealer, se establecio una lógica sencilla basada en un criterio de que el puntaje para pedir una siguiente carta debe ser menor o igual a 18 pero en caso de usar un criterio diferente se puede cambiar la condición.
# Informacion
En el repositorio hay 3 archivos el funcionamiento del ejercicio solo el archivo que dice barajaBasica.py, los otros dos archivos son la implantación del ejercicio en Haskell pero no tiene funcionamiento real, por eso ignóralo.
# Desarrolladas por:
- Arlo Nicolas Ocampo Gallego - 20221020104
- Juan Jesus Poveda Avila - 20202020128
- Brayan Stiven Galindo Suesca - 20212020133
