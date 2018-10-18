import trenes.*



class Deposito {
	

	var property formacionesArmadas
	
	var property locomotorasSueltas
	
	
	
	method vagonMasPesadoPorFormacion(){
		
	return formacionesArmadas.map{ formacion => formacion.vagonMasPesado() }.asSet()
		
		
	}
	
	
	method necesitaConductor(){
		
		
		return formacionesArmadas.any{formacion=> formacion.esCompleja()} 
		
	}
	

	
	
	method agregarLocomotoraAFormacion(formacion) {
		
		if (not formacion.formacionPuedeMoverse()) formacion.agregarLocomotora(locomotorasSueltas)
		
		
	}
	
}