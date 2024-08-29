from random import randint, choice

musicos = ['Carlos', 'Andrea', 'Luis', 'Marta', 'Diego', 'Ana', 'Jorge', 'Sofia', 'Pedro', 'Laura']
instrumentos_cuerda = ["Guitarra", "Violín", "Arpa"]
instrumentos_viento = ["Flauta", "Saxofón", "Trompeta"]
instrumentos_percusion = ["Tambor", "Batería", "Cajón"]
instrumentos_electricos = ["Guitarra Eléctrica", "Bajo Eléctrico", "Teclado"]

class Banda:

    def __init__(self):
        self.musicos = []
        self.instrumentos = []

    def generarIntegrantes(self):
        numIntegrantes = randint(1, 10)
        for i in range(numIntegrantes):
            self.musicos.append(Musico((musicos)))

            tipoInstrumento = randint(1,4)
            match tipoInstrumento:
                case 1:
                    self.instrumentos.append(InstrumentoCuerda(choice(instrumentos_cuerda)))
                case 2:
                    self.instrumentos.append(InstrumentoViento(choice(instrumentos_viento)))
                case 3:
                    self.instrumentos.append(InstrumentoPercusion(choice(instrumentos_percusion)))
                case 4:
                    self.instrumentos.append(InstrumentoElectrico(choice(instrumentos_electricos)))
        
    def afinarInstrumentos(self):
        for i, musico in enumerate(self.musicos):
            musico.afinarInstrumento(self.instrumentos[i])
        print("Se han afinado todos los instrumentos")

    def tocarInstrumentos(self):
        for i, musico in enumerate(self.integrantes):
            musico.tocarInstrumento(self.instrumentos[i])
        print("La banda ha tocado todos los instrumentos")


class Instrumento:
    def afinarInstrumento(self):
        pass
    def tocarInstrumento(self):
        pass

class InstrumentoCuerda(Instrumento):
    def __init__(self, nombre):
        self.nombre = nombre
    def afinarInstrumento(self):
        print(f"Afinando instrumento de cuerda, {self.nombre}")
    def tocarInstrumento(self):
        print(f"Tocando instrumento de cuerda, {self.nombre}")

class InstrumentoViento(Instrumento):
    def __init__(self, nombre):
        self.nombre = nombre
    def afinarInstrumento(self):
        print(f"Afinando instrumento de viento, {self.nombre}")
    def tocarInstrumento(self):
        print(f"Tocando instrumento de viento, {self.nombre}")

class InstrumentoPercusion(Instrumento):
    def __init__(self, nombre):
        self.nombre = nombre
    def afinarInstrumento(self):
        print(f"Afinando instrumento de percusión, {self.nombre}")
    def tocarInstrumento(self):
        print(f"Tocando instrumento de percusión, {self.nombre}")

class InstrumentoElectrico(Instrumento):
    def __init__(self, nombre):
        self.nombre = nombre
    def afinarInstrumento(self):
        print(f"Afinando instrumento electrico, {self.nombre}")
    def tocarInstrumento(self):
        print(f"Tocando instrumento electrico, {self.nombre}")

class Musico:
    def __init__(self, nombre):
        self.nombre = nombre
    def afinarInstrumento(self, instrumento):
        print(f"{self.nombre} está afinando {instrumento.nombre}.")
        instrumento.afinarInstrumento()

    def tocarInstrumento(self, instrumento):
        print(f"{self.nombre} está tocando {instrumento.nombre}.")
        instrumento.tocarInstrumento()


banda = Banda()
banda.generarIntegrantes()
banda.afinarInstrumentos()
banda.tocarInstrumentos()