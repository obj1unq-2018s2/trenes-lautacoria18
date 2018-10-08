class Locomotora{
	
	var property peso
	var property pesoMaximo
	var property velocidadMaxima
	
	
	
}

class VagonDePasajeros {
	
	var property largoDeVagon
	var property anchoDeVagon
	
		method cantPasajeros()= if (anchoDeVagon > 2.5) 10
								else largoDeVagon * 8 
								
								
		method pesoMaximo() = self.cantPasajeros() * 80
	
	
}

class VagonDeCarga {
	
	var property cargaMaxima 
	
	method	pesoMaximo() = cargaMaxima + 160
}

class Formacion {}
