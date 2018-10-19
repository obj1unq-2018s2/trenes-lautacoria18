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

class FormacionConTrenesRapidos inherits Formacion {
	
	override method estaBienArmada() {
		
		return self.velocidadMaxima() > 250 and self.todosVagonesLivianos()
	}
	
	
	override method velocidadMaxima() = 400
	
	
	
	
	
}

class FormacionDeLargaDistancia inherits Formacion {
	
	
	var property uneDosCiudades
	
	override method estaBienArmada() {
		
				return super() and self.hayBanioCada50()
	}
		
	override method velocidadMaxima() = if  (uneDosCiudades) 200 else 150
	
}

class FormacionDeCortaDistancia inherits Formacion {
	
	override method estaBienArmada(){
					return super() and not self.esCompleja()
					
	}
	
	override method velocidadMaxima() = 60
		
				
	
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
	
	method estaBienArmada() {return self.formacionPuedeMoverse()}
	
	method hayBanioCada50() {return self.cantPasajerosFormacion()/50 >= 1}
	
	method cantPasajerosFormacion() {return vagones.sum{vagon => vagon.cantPasajeros()}}
	
	method todosVagonesLivianos() {return vagones.all{vagon=>vagon.pesoMaximo()<2500}}
	
	
	//Metodos de ejercicios
	
	method vagonesLivianos() {return vagones.count{vagon=>vagon.pesoMaximo()<2500}}

	method velocidadMaxima() {return locomotoras.min{tren => 
			tren.velocidadMaxima()}.velocidadMaxima()
	}
	
	method formacionEficiente() {return locomotoras.all{tren => tren.arrastreUtil()>=tren.peso()*5}}
	

	method formacionPuedeMoverse(){return self.arrastreUtilTotal() >= self.pesoTotalDeVagones()}
	
	method cuantosKilosFaltan() {return if (self.formacionPuedeMoverse()) 0 else self.pesoTotalDeVagones() - self.arrastreUtilTotal()}


		
}


