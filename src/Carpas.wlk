import Jarras.*
import Personas.*

class Carpa {
	var property personas = #{}
	var property limiteDeGente = 0
	var property bandaDeMusicaTradicional = null
	var property marcaQueVende = null
	
	method dejaEntrarA(unaPersona) = self.cantDePersonas() < limiteDeGente && not unaPersona.estaEbrio()
	method cantDePersonas() = personas.size()
	method hacerEntrarPersona(unaPersona) {
		if (unaPersona.puedeEntrarACarpa(self)) {
			personas.add(unaPersona)
		} else {
			self.error("No puede entrar")
		}
	}
	method servirJarraDe_LtsA(lts, unaPersona) { 
		if (personas.contains(unaPersona)) {
			unaPersona.comprarJarra(new Jarra(capasidadLts = lts, marca = marcaQueVende, carpa = self))
		} else {
			self.error("Esa persona no está en la carpa")
		}
	}
	method ebriosEmpedernidos() = personas.sum({ pers => pers.esEbrioEmperdernido() })
	method esHomogenea() = 	personas.all({ per => per.pais() == personas.anyOne().pais() })
	
	method asistentesQueNoBebieron() = personas.filter({ per => not per.carpasDondeBebio().contains(self) })
}
