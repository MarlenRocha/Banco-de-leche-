# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_enfermedades').validate
		rules: 
			'enfermedad[nombre]':
				required: true
				minlength: 2
				maxlength: 50	
			'enfermedad[descripcion]':
				required: true
				minlength: 2
				maxlength: 100
			'enfermedad[tratamiento]':
				required: true
				minlength: 2
				maxlength: 100
			'enfermedad[tipo]':
				required: true
				minlength: 2
				maxlength: 20
			'enfermedad[clasificacion]':
				required: true
			'enfermedad[nueva]':
				required: true														
		messages:					
			'enfermedad[nombre]':
				required: 'Campo requerido'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'enfermedad[descripcion]':	
				required: 'Campo requerido'	
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 100 caracteres'
			'enfermedad[tratamiento]':
				required: 'Campo requerido'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 100 caracteres'
			'enfermedad[tipo]':
				required: 'Campo requerido'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 20 caracteres'
			'enfermedad[clasificacion]':
				required: 'Campo requerido'
			'enfermedad[nueva]':
				required: 'Campo requerido'						

$(document).ready(ready)
$(document).on('turbolinks:load',ready)