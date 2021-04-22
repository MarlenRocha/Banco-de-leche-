# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_clasificaciones').validate
		rules: 
			'clasificacion[nombre]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50	
			'clasificacion[descripcion]':
				required: true
				minlength: 2
				maxlength: 100
			'clasificacion[color]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'clasificacion[consistencia]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 20
			'clasificacion[proteina]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 20
			'clasificacion[cantidad]':
				required: true
				regexp: /^[0-9]+\.?[0-9]*$/														
		messages:					
			'clasificacion[nombre]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'clasificacion[descripcion]':	
				required: 'Campo requerido'	
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 100 caracteres'
			'clasificacion[color]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'clasificacion[consistencia]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 20 caracteres'
			'clasificacion[proteina]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 20 caracteres'
			'clasificacion[cantidad]':
				required: 'Campo requerido'
				regexp: 'Solo se aceptan números enteros o decimales'

	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)						

$(document).ready(ready)
$(document).on('turbolinks:load',ready)