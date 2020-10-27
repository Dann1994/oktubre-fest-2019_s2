import Jarras.*
import Personas.*

class Carpa {
	const property personas = #{}
	const property limiteDeGente = 0
	const property bandaDeMusicaTradicional = null
	const property marca = null
	
	method dejaEntrarA(unaPersona) = personas.size() < limiteDeGente && not unaPersona.estaEbrio()
	method hacerEntrarPersona(unaPersona) {
		if (self.dejaEntrarA(unaPersona) && unaPersona.quiereEntrarACarpa(self)) {
			personas.add(unaPersona)
		} else {
			self.error("limite exedido")
		}
	}
	method servirJarraDe_LtsA(lts, unaPersona) { 
		if (personas.contains(unaPersona)) {
			unaPersona.comprarJarra(new Jarra(capasidadLts = lts, marca = marca, carpa = self))
		} else {
			self.error("Esa persona no está en la carpa")
		}
	}
	method ebriosEmpedernidos() = personas.sum({ pers => pers.esEbrioEmperdernido() })
	method esHomogenea() = 	personas.all({ per => per.pais() == personas.anyOne().pais() })
	
	method asistentesQueNoBebieron() = personas.filter({ per => not per.carpasDondeBebio().contains(self) })
}
