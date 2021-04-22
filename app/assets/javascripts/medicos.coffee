# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_medicos').validate
		rules: 
			'medico[nombre]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'medico[paterno]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'medico[materno]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'medico[nacionalidad_id]':
				required: true
			'medico[edad]':
				required: true
				regexp: /^[0-9]*$/
				min: 0
				max: 120
			'medico[telefono]':
				required: true
				regexp: /^[0-9]*$/
				minlength: 10
				maxlength: 10						
			'medico[sexo]':
				required: true	
			'medico[especialidad_id]':
				required: true	
			'medico[hospital_id]':
				required: true											
		messages:
			'medico[nombre]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'	
				minlength: 'Mínimo 2 carácteres'
				maxlength: 'Máximo 50 carácteres'
			'medico[paterno]':	
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Mínimo 2 caracteres'
				maxlength: 'Máximo 50 caracteres'
			'medico[materno]':	
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Mínimo 2 carácteres'
				maxlength: 'Máximo 50 carácteres'
				required: 'Campo requerido'	
			'medico[nacionalidad_id]':
				required: 'Campo requerido'
			'medico[edad]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números'
				min: 'Edad no valida'
				max:'Edad no valida'		
			'medico[telefono]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números'
				minlength: 'Teléfono no valido'
				maxlength: 'Teléfono no valido'	
			'medico[sexo]':
				required: 'Campo requerido'	
			'medico[especialidad_id]':
				required: 'Campo requerido'	
			'medico[hospital_id]':
				required: 'Campo requerido'	
										
	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)	

$(document).ready(ready)
$(document).on('turbolinks:load',ready)