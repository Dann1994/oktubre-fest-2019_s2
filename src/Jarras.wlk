import Cervezas.*

class Jarra {
	const property capasidadLts = 0
	const property marca = null
	const property carpa = null
	
	method contenidoDeAlcohol() = capasidadLts * marca.graduacion()
}
