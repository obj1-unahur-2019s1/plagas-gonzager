class Hogar {
	var property nivelDeMugre
	var property confort
	
	method esBueno() = return nivelDeMugre <= confort * 0.5
	method recibirAtaque(plaga){
		nivelDeMugre += plaga.nivelDeDanio()	
	}

}

class Huerta {
	var property produccion
	const property nivel = nivelDeProduccion
	method esBueno() = return produccion > nivel.nivel()
	method recibirAtaque(plaga){
		produccion -= plaga.nivelDeDanio() * 0.1
		if (plaga.transmiteEnfermedades())
			produccion -= 10
	}
}

class Mascota {
	var property nivelDeSalud
	method esBueno() = return nivelDeSalud > 250
	method recibirAtaque(plaga){
		if (plaga.transmiteEnfermedades())
			nivelDeSalud -= plaga.nivelDeDanio()
	}
}
object nivelDeProduccion {var property nivel = 0}


class Barrio{
	const property elementos = []
	method agregarElemento(elemento) {elementos.add(elemento)}
	method sacarElemento(elemento) {elementos.remove(elemento)}	
	method esCopado()= return elementos.count({e=>e.esBueno()}) > elementos.count({e=>not e.esBueno()})
}