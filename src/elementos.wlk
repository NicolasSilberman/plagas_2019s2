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
	
	method esBuena() {return capacidadProduccion > nivelDeHuerta.nivel()}
	method esAtacadoPor(plaga) {
		capacidadProduccion = (capacidadProduccion - plaga.nivelDeDanio() * 0.10).max(0)
		if (plaga.transmiteEnfermedades()) {capacidadProduccion = (capacidadProduccion - 10).max(0)}
	}
	
}

class Mascota {
	var property nivelDeSalud
	
	method esBuena() {return nivelDeSalud > 250}
	method esAtacadoPor(plaga) {
		if(plaga.transmiteEnfermedades()) {nivelDeSalud = (nivelDeSalud - plaga.nivelDeDanio()).max(0)}
	}
}

object nivelDeHuerta {
	var property nivel
}