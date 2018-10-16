class Locomotora{
	
	
	var property peso
	var property velocidadMaxima
	var property pesoQuePuedeArrastrar
	method pesoMaximo() = pesoQuePuedeArrastrar + peso
	

	
}

class VagonDePasajeros {
	
	var property largoDeVagon
	var property anchoDeVagon
	
		method cantPasajeros()= if (anchoDeVagon > 2.5)largoDeVagon * 10
								else largoDeVagon * 8 
								
								
		method pesoMaximo() = self.cantPasajeros() * 80
		
		

	
	
}

class VagonDeCarga {
	
	var property cargaMaxima 
	
	method cantPasajeros() = 0
	
	method	pesoMaximo() = cargaMaxima + 160
	
	method esLocomotora() = false
}

class Formacion {
	
	var property trenes
	var property locomotoras
	method vagonesLivianos() {return trenes.count{vagon=>vagon.pesoMaximo()<2500}}

	method velocidadMaxima() {return locomotoras.min{tren => 
			tren.velocidadMaxima()}.velocidadMaxima()
	}
	
	method formacionEficiente() {return locomotoras.all{tren => tren.pesoQuePuedeArrastrar()>=tren.peso()*5}}
	
	method formacionPuedeMoverse(){return locomotoras.sum{locomotora => locomotora.pesoMaximo() } >= trenes.sum{ vagon => vagon.pesoMaximo() }}
	//method formacionPuedeMoverse(){return locomotoras.flatten(){tren =>tren.pesoQuePuedeArrastrar()}}//locomotoras.pesoQuePuedeArrastrar().sum() > (vagones.pesoMaximo()).sum()}
	
	
}
