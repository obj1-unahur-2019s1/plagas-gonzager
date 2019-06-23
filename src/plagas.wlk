class Plaga  {
	var property poblacion 
	method transmiteEnfermedades() = return poblacion >= 10
	method aumentarProblacion(valor) { poblacion *= valor}
	method atacar(elemento){
		self.aumentarProblacion(1.1)
		elemento.recibirAtaque(self)
		
	}
}

class Cucaracha inherits Plaga {
	var property pesoPromedio
	method nivelDeDanio() = return self.poblacion() * 0.5
	override 
	method transmiteEnfermedades() = return super() && pesoPromedio >  10 
	override
	method atacar(elemento){
		super(elemento)
		pesoPromedio += 2
	}
}

class Pulga inherits Plaga {
	method nivelDeDanio() = return self.poblacion() * 2
}

class Garrapata inherits Pulga {
	override method atacar(elemento){
		self.aumentarProblacion(1.2)
		elemento.recibirAtaque(self)
		
	}	
}

class Mosquito inherits Plaga {
	method nivelDeDanio() = return self.poblacion()
	override 
	method transmiteEnfermedades() = return super() && self.poblacion() % 3 == 0
}