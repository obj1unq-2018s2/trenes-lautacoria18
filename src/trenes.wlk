class Locomotora{
	
	
	var property peso
	var property velocidadMaxima
	var property pesoMaximoQuePuedeArrastrar
	method arrastreUtil() = pesoMaximoQuePuedeArrastrar - peso
	

	
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
	
	var property vagones
	var property locomotoras
	
	//Metodos de subtareas
	
	method arrastreUtilTotal() {return locomotoras.sum{locomotora => locomotora.arrastreUtil() }}
	
	method pesoTotalDeVagones() {return vagones.sum{ vagon => vagon.pesoMaximo() }}
	
	method pesoTotalDeLocomotoras() {return locomotoras.sum{locomotora => locomotora.pesoMaximo()}}
	
	//Metodos de ejercicios
	
	method vagonesLivianos() {return vagones.count{vagon=>vagon.pesoMaximo()<2500}}

	method velocidadMaxima() {return locomotoras.min{tren => 
			tren.velocidadMaxima()}.velocidadMaxima()
	}
	
	method formacionEficiente() {return locomotoras.all{tren => tren.arrastreUtil()>=tren.peso()*5}}
	
//	method formacionPuedeMoverse(){return locomotoras.sum{locomotora => locomotora.arrastreUtil() } >= vagones.sum{ vagon => vagon.pesoMaximo() }}
	method formacionPuedeMoverse(){return self.arrastreUtilTotal() >= self.pesoTotalDeVagones()}
	
	method cuantosKilosFaltan() {return if (self.formacionPuedeMoverse()) 0 else self.pesoTotalDeVagones() - self.arrastreUtilTotal()}
	
}
