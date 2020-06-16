import elementos.*

class Plagas {
	var property poblacion
	
	method transmiteEnfermedades() {return self.poblacion() >= 10}
	method atacarA(elemento) {
		elemento.esAtacadoPor(self)
		poblacion = (poblacion * self.aumentoPoblacion()).roundUp()
	}
	method nivelDeDanio() {return poblacion}
	method aumentoPoblacion() {return 1.10}
}
class Cucarachas inherits Plagas{
	var property pesoPromedio
	override method transmiteEnfermedades() {return super() and pesoPromedio >= 10}
	override method nivelDeDanio() {return super() / 2}
	override method atacarA(elemento) {
		super(elemento)
		pesoPromedio += 2
	}
	
}
class Mosquitos inherits Plagas{
	override method transmiteEnfermedades() {return super() and poblacion % 3 == 0}
}
class Pulgas inherits Plagas {
	override method nivelDeDanio() {return super() * 2}
}
class Garrapatas inherits Plagas{
	override method nivelDeDanio() {return super() * 2}
	override method aumentoPoblacion() {return super() + 0.10}
}
