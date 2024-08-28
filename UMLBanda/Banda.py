from random import randint, choice
from integrantes import *

musicos = ['Carlos', 'Andrea', 'Luis', 'Marta', 'Diego', 'Ana', 'Jorge', 'Sofia', 'Pedro', 'Laura']
instrumentos_cuerda = ["Guitarra", "Violín", "Arpa"]
instrumentos_viento = ["Flauta", "Clarinete", "Trompeta"]
instrumentos_percusion = ["Tambor", "Batería", "Cajón"]
instrumentos_electricos = ["Guitarra Eléctrica", "Bajo Eléctrico", "Sintetizador"]

class Banda:
    musicos = []
    instrumentos = []

    def __init__(self) -> None:
        self.generarIntegrantes()
    def generarIntegrantes(self):
        numIntegrantes = randint(3, 10)
        for i in range(numIntegrantes):
            self.musicos.append(choice(musicos))

        for i in range(numIntegrantes):
            tipoInstrumento = randint(1,4)
            seleccionInstrumento = (randint(1,3))
            match tipoInstrumento:
                case 1:
                    self.instrumentos.append(instrumentos_cuerda[seleccionInstrumento])
                case 2:
                    self.instrumentos.append(instrumentos_viento[seleccionInstrumento])
                case 3:
                    self.instrumentos.append(instrumentos_percusion[seleccionInstrumento])
                case 4:
                    self.instrumentos.append(instrumentos_electricos[seleccionInstrumento])
        
    def afinar():
        Musico.afinarInstrumento()
