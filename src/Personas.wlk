import Jarras.*
import Carpas.*

class Persona {
	const peso = 0
	const nivelDeAguante = 0
	const property leGustaMasicaTradicional = null
	const property pais = null
	const property jarras = []
	const property marcas = #{}
	
	method alcohoInegrido() = jarras.sum({ jar => jar.contenidoDeAlcohol() })
	method estaEbrio() = self.alcohoInegrido() * peso > nivelDeAguante
	method comprarJarra(unaJarra) { jarras.add(unaJarra) }
	method leGustaMarca(unaMarca) = true
	method quiereEntrarACarpa(unaCarpa) { 
	    return self.leGustaMarca(unaCarpa.marca()) && 
	    leGustaMasicaTradicional == unaCarpa.bandaDeMusicaTradicional()
	}
	method puedeEntrarACarpa(unaCarpa) = self.quiereEntrarACarpa(unaCarpa) && unaCarpa.dejaEntrarA(self)
	method esEbrioEmperdernido() = jarras.all({ jar => jar.capasidadLts() >= 1 })
	method entrarEnCarpa(unaCarpa) { unaCarpa.hacerEntrarPersona(self) }
	method esPatriota() = jarras.all({ jar => jar.marca().pais() == self.pais() })
	
	method marcasProbadas() = jarras.map({ jar => jar.marca() }).asSet()
	method marcasEnComunCon(unaPersona) = self.marcasProbadas().intersection(unaPersona.marcasProbadas())
	method marcasDiferentesCon(unaPersona) = self.marcasProbadas().difference(unaPersona.marcasProbadas())
	method esCompatibleCon(unaPersona) {
		return self.marcasEnComunCon(unaPersona).size() > unaPersona.marcasDiferentesCon(unaPersona).size()
	}
	method carpasDondeBebio() = jarras.map({ jar => jar.carpa() }).asSet()
	method jarrasMasChicaAMasGramde() = jarras.sortedBy {a, b => a.capasidadLts() < b.capasidadLts()} 
	method EstaEntrandoEnElVicio() = self.jarrasMasChicaAMasGramde() == jarras && jarras.size() > 1
}

class Belga inherits Persona {
	
	override method leGustaMarca(unaMarca) = unaMarca.lupuo() > 4 
	override method pais() = "Belgica"
}

class Checo inherits Persona {
	
	override method leGustaMarca(unaMarca) = unaMarca.graduacion() > 0.08
	override method pais() = "República Checa"

}

class Aleman inherits Persona {
     const minimoDeGenteEnCarpa = 0
     
     override method quiereEntrarACarpa(unaCarpa) = 
     super(unaCarpa) && unaCarpa.personas().size() >= minimoDeGenteEnCarpa
     override method pais() = "Alemania"

}