# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_areas').validate
		rules: 
			'area[nombre]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50	
			'area[descripcion]':
				required: true
				minlength: 2
				maxlength: 100
			'area[ubicacion]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 20
			'area[existencia]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 20
			'area[funcion]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 20
			'area[cantidad]':
				required: true
				regexp: /^[0-9]*$/
				min: 0
				max: 10														
		messages:					
			'area[nombre]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Mínimo 2 caracteres'
				maxlength: 'Máximo 50 caracteres'
			'area[descripcion]':	
				required: 'Campo requerido'	
				minlength: 'Mínimo 2 caracteres'
				maxlength: 'Máximo 100 caracteres'
			'area[ubicacion]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Mínimo 2 caracteres'
				maxlength: 'Máximo 20 caracteres'
			'area[existencia]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Máximo 20 caracteres'
			'area[funcion]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Mínimo 2 caracteres'
				maxlength: 'Máximo 20 caracteres'
			'area[cantidad]':
				required: 'Campo requerido'
				regexp: 'Solo se aceptan números'
				min: 'Cantidad no válida'
				max:'Cantidad no valida'	

	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)					

$(document).ready(ready)
$(document).on('turbolinks:load',ready)