class Cerveza {
	const property lupuo = 0
	const property pais = null
	var property graduacionReglamentaria = 0.15
}

class Rubia inherits Cerveza {
	const property graduacion = 0
}

class Negra inherits Cerveza {
	
	method graduacion() = graduacionReglamentaria.min(lupuo * 2)
}

class Roja inherits Negra {
	
	override method graduacion() = super() * 1.25
}
