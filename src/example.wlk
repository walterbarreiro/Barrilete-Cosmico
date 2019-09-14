object barrileteCosmico {
	var destinos = [garlicsSea, silversSea, lastToninas, goodAirs]
	
	method destinosMasImportantes() {
		return destinos.all({destino => destino.esDestinoDestacado()})
	}
	
	method aplicarDescuentoALosDestinos(descuento) {
		return destinos.forEach({destino => destino.aplicarDescuento(descuento)})
	}
	
	method esEmpresaExtrema() {
		return destinos.filter({destino => destino.esDestinoDestacado()}).any({destino => destino.requiereLlevarVacuna()})
	}
	
	method cartaDeDestinos() {
		return destinos.map({destino => destino.nombre()})
	}
}

class Destino {
	var property nombre
	var precio
	var equipaje = []
	
	method precio() {
		return precio
	}
	
	method esDestinoDestacado() {
		return precio > 2000
	}
	
	method aplicarDescuento(descuento) {
		precio *= descuento / 100
		equipaje.add(certificadoDeDescuento)
	}
	
	method requiereLlevarVacuna() {
		return equipaje.any({equipo => equipo.esVacuna()})
	}
}

object garlicsSea inherits Destino {
	nombre = "Garlic's Sea"
}

object silversSea {
	
}

object lastToninas {
	
}

object goodAirs {
	
}

class Equipo {
	const nombre
	
	method esVacuna() {
		return nombre.contains("Vacuna")
	}
}

object certificadoDeDescuento {
	
}

object pabloHari {
	const nombre = "PHari"
	var cuenta = 1500
	var lugaresVisitados = [lastToninas, goodAirs]
	var seguidores = []
	var kilometros
	
	method volarA(unDestino) {
		if (self.puedeVolarA(unDestino)) {
			cuenta -= unDestino.precio()
			lugaresVisitados.add(unDestino)
		}
	}
	
	method puedeVolarA(unDestino) {
		return cuenta >= unDestino.precio()
	}
	
	method obtenerKilometros() {
		kilometros = lugaresVisitados.sum({destino => destino.precio()}) * 0.1
	}
	
	method kilmetros() {
		return kilometros
	}
	
	method seguirA(unUsuario) {
		seguidores.add(unUsuario)
	}
}