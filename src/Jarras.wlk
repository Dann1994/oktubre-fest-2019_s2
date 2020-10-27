import Cervezas.*

class Jarra {
	const property capasidadLts = 0
	var property marca = null
	const property carpa = null
	
	method contenidoDeAlcohol() = capasidadLts * self.marca().graduacion()
}
