# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_pasteurizaciones').validate
		rules: 
			'pasteurizacion[pasteurizacion]':
				required: true
				regexp: /^[0-9]*$/
				min: 1
				max: 8
			'pasteurizacion[etiqueta_id]':
				required: true
			'pasteurizacion[cantidad_almacenada]':
				required: true
				regexp: /^[0-9]+\.?[0-9]*$/
			'pasteurizacion[cantidad_desechada]':
				required: true
				regexp: /^[0-9]+\.?[0-9]*$/										
			'pasteurizacion[acidez_dornic]':
				required: true
				regexp: /^[0-9]*$/
				min: 1
				max: 4	
		messages:
			'pasteurizacion[pasteurizacion]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros'
				min: 'Sólo se aceptan valores enteros entre 1 y 8'
				max: 'Sólo se aceptan valores enteros entre 1 y 8'
			'pasteurizacion[etiqueta_id]':	
				required: 'Campo requerido'
			'pasteurizacion[cantidad_almacenada]':	
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros o decimales'	
			'pasteurizacion[cantidad_desechada]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros o decimales'
			'pasteurizacion[acidez_dornic]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros'
				min: 'Sólo se aceptan valores entre 1 y 4'
				max: 'Sólo se aceptan valores entre 1 y 4'				
										
	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)	

$(document).ready(ready)
$(document).on('turbolinks:load',ready)