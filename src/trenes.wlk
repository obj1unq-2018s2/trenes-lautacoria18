class Locomotora{
	
	
	var property peso
	var property velocidadMaxima
	var property pesoQuePuedeArrastrar
	method pesoMaximo() = pesoQuePuedeArrastrar + peso
	
	method esLocomotora() = true
	
}

class VagonDePasajeros {
	
	var property largoDeVagon
	var property anchoDeVagon
	
		method cantPasajeros()= if (anchoDeVagon > 2.5)largoDeVagon * 10
								else largoDeVagon * 8 
								
								
		method pesoMaximo() = self.cantPasajeros() * 80
		
		
		method esLocomotora() = false
	
	
}

class VagonDeCarga {
	
	var property cargaMaxima 
	
	method cantPasajeros() = 0
	
	method	pesoMaximo() = cargaMaxima + 160
	
	method esLocomotora() = false
}

class Formacion {
	
	var property trenes
	
	method vagonesLivianos() {return trenes.count{vagon=>vagon.pesoMaximo()<2500}}

	method velocidadMaxima() {return trenes.filter{tren => 
			tren.esLocomotora()
	}.min{locomotora=>
			locomotora.velocidadMaxima()
	}.velocidadMaxima()
	}
	
	method formacionEficiente() {}
	
	
	
}
