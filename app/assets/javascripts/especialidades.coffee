# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_especialidades').validate
		rules: 
			'especialidad[nombre]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50	
			'especialidad[descripcion]':
				required: true
				minlength: 2
				maxlength: 100
			'especialidad[orientacion]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 20
			'especialidad[agrupacion]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 20
			'especialidad[lugar]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 20	
			'especialidad[anio]':
				required: true
				regexp: /^[0-9]*$/
				min: 1900
				max: 2099														
		messages:					
			'especialidad[nombre]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'especialidad[descripcion]':	
				required: 'Campo requerido'	
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 100 caracteres'
			'especialidad[orientacion]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 20 caracteres'
			'especialidad[agrupacion]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 20 caracteres'
			'especialidad[lugar]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 20 caracteres'
			'especialidad[anio]':
				required: 'Campo requerido'
				regexp: 'Solo se aceptan numeros'
				min: 'Año no valido'
				max:'Año no valido'					

$(document).ready(ready)
$(document).on('turbolinks:load',ready)