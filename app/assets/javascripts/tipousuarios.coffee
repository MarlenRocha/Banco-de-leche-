# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_tipousuarios').validate
		rules: 
			'tipousuario[nombre]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50	
			'tipousuario[descripcion]':
				required: true
				minlength: 2
				maxlength: 100
			'tipousuario[salario]':
				required: true
				regexp: /^[0-9]+\.?[0-9]*$/
			'tipousuario[rango]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'tipousuario[seguro]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 20
			'tipousuario[vacaciones]':
				required: true
				regexp: /^[0-9]*$/
				max: 31														
		messages:					
			'tipousuario[nombre]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Mínimo 2 carácteres'
				maxlength: 'Máximo 50 carácteres'
			'tipousuario[descripcion]':	
				required: 'Campo requerido'	
				minlength: 'Mínimo 2 carácteres'
				maxlength: 'Máximo 100 carácteres'
			'tipousuario[salario]':
				required: 'Campo requerido'
				regexp: 'Formato no válido, solo se aceptan números enteros o decimales'
			'tipousuario[rango]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Mínimo 2 carácteres'
				maxlength: 'Máximo 50 carácteres'
			'tipousuario[seguro]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Mínimo 2 carácteres'
				maxlength: 'Máximo 20 carácteres'
			'tipousuario[vacaciones]':
				required: 'Campo requerido'
				regexp: 'Solo se aceptan números'
				max: 'Número no válido'

	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)					

$(document).ready(ready)
$(document).on('turbolinks:load',ready)