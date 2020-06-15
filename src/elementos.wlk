import plagas.*

class Barrio {
	var elementos = []
	
	method agregarElementos(elemento) { elementos.addAll(elemento) }
	method quitarElementos(elemento) { elementos.remove(elemento) }
	method elementos() {return elementos}
	
	method buenos() {return elementos.filter({e => e.esBuena()})}
	method malos() {return elementos.filter({e => not e.esBuena()})}
	
	method esCopado() { return self.buenos().size() > self.malos().size()}
	
	/*
	 * Podria haber usado este metodo pero creo que es mejor el acceso a la lista de buenos y malos "por las dudas"
	method esCopado2() {return elementos.filter({e => e.esBuena()}).size() > elementos.filter({e => not e.esBuena()}).size() }
	*/
}

class Hogar {
	var property nivelDeMugre
	var property confort
	
	method esBuena() { return nivelDeMugre <= (confort /2) }
	method esAtacadoPor(plaga) {nivelDeMugre += plaga.nivelDeDanio()}	
}

class Huerta {
	var property capacidadProduccion
	var property nivel
	
	method esBuena() {return capacidadProduccion > nivel}
	method esAtacadoPor(plaga) {
		capacidadProduccion -= plaga.nivelDeDanio() * 0.10
		if (plaga.transmiteEnfermedades()) {capacidadProduccion -= 10}
	}
	
}

class Mascota {
	var property nivelDeSalud
	
	method esBuena() {return nivelDeSalud > 250}
	method esAtacadoPor(plaga) {
		if(plaga.transmiteEnfermedades()) {nivelDeSalud -= plaga.nivelDeDanio()}
	}
}
