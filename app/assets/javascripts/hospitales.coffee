# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_hospitales').validate
		rules: 
			'hospital[nombre]':
				required: true
				minlength: 2
				maxlength: 50	
			'hospital[descripcion]':
				required: true
				minlength: 2
				maxlength: 100
			'hospital[telefono]':
				required: true
				regexp: /^[0-9]*$/
				minlength: 10
				maxlength: 10
			'hospital[direccion]':
				required: true
				minlength: 2
				maxlength: 100
			'hospital[estado_id]':
				required: true
			'hospital[correo]':
				required: true
				regexp: /^[a-zA-Z0-9-.!#$%&'*+/=?^_{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/			
		messages:					
			'hospital[nombre]':
				required: 'Campo requerido'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'hospital[descripcion]':	
				required: 'Campo requerido'	
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 100 caracteres'
			'hospital[telefono]':
				required: 'Campo requerido'
				regexp: 'Solo se aceptan números'
				minlength: 'Teléfono no válido'
				maxlength: 'Teléfono no válido'
			'hospital[direccion]':
				required: 'Campo requerido'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 100 caracteres'
			'hospital[estado_id]':
				required: 'Campo requerido'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'hospital[correo]':
				required: 'Campo requerido'
				regexp: 'Correo no válido'

	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)						

$(document).ready(ready)
$(document).on('turbolinks:load',ready)