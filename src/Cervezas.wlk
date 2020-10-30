class Cerveza {
	const property lupulo = 0
	const property pais = null
	
	method graduacion()
}

class Rubia inherits Cerveza {
	const property graduacion = 0
}


class Negra inherits Cerveza {
	
	override method graduacion() = graduacionReglamentaria.graduacion().min(lupulo * 2)
}

class Roja inherits Negra {
	
	override method graduacion() = super() * 1.25
}

object graduacionReglamentaria {
	var property graduacion = 0.15
}
