import Deposito.*
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
	
	method vagonMasPesado() {return vagones.max{vagon => vagon.pesoMaximo()}}
	
	method cantidadDeVagonesYLocomotoras(){ return vagones.size() + locomotoras.size()}
	
	method esCompleja(){return self.cantidadDeVagonesYLocomotoras()> 20 or self.pesoTotalDeVagones() + self.pesoTotalDeLocomotoras() > 10000}
	
	method buscarLocomotora(locos){return locos.find {locomotora => locomotora.arrastreUtil() >= self.cuantosKilosFaltan()}}
	
	method agregarLocomotora(locos){ locomotoras.add(self.buscarLocomotora(locos))}
	
	
	//Metodos de ejercicios
	
	method vagonesLivianos() {return vagones.count{vagon=>vagon.pesoMaximo()<2500}}

	method velocidadMaxima() {return locomotoras.min{tren => 
			tren.velocidadMaxima()}.velocidadMaxima()
	}
	
	method formacionEficiente() {return locomotoras.all{tren => tren.arrastreUtil()>=tren.peso()*5}}
	

	method formacionPuedeMoverse(){return self.arrastreUtilTotal() >= self.pesoTotalDeVagones()}
	
	method cuantosKilosFaltan() {return if (self.formacionPuedeMoverse()) 0 else self.pesoTotalDeVagones() - self.arrastreUtilTotal()}


		
}


