import plagas.*

class Barrio {
	var elementos = []
	
	method agregarElementos(elemento) { elementos.addAll(elemento) }
	method quitarElementos(elemento) { elementos.remove(elemento) }
	method elementos() {return elementos}
	
	method buenos() {return elementos.filter({e => e.esBuena()})}
	method malos() {return elementos.filter({e => not e.esBuena()})}
	
	method esCopado() { return self.buenos().size() > self.malos().size()}
	method esCopado2() {return elementos.filter({e => e.esBuena()}).size() > elementos.filter({e => not e.esBuena()}).size() }
	
	
}

class Hogar {
	var property nivelDeMugre
	var property confort
	
	method esBuena() { return nivelDeMugre <= (confort /2) }	
}

class Huerta {
	var property capacidadProduccion
	var property nivel
	
	method esBuena() {return capacidadProduccion > nivel}
	
}

class Mascota {
	var property nivelDeSalud
	
	method esBuena() {return nivelDeSalud > 250}
}
