# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_analisisregistros').validate
		rules: 
			'analisisregistro[etiqueta_id]':
				required: true
			'analisisregistro[crematocrito]':
				required: true
				regexp: /^[0-9]*$/	
			'analisisregistro[kilocalorias]':
				required: true
				regexp: /^[0-9]*$/
			'analisisregistro[proteinas]':
				required: true
				regexp: /^[0-9]*$/	
			'analisisregistro[carbohidratos]':
				required: true
				regexp: /^[0-9]*$/
			'analisisregistro[grasas]':
				required: true
				regexp: /^[0-9]*$/
			'analisisregistro[clasificacion_id]':
				required: true
			'analisisregistro[cantidad_almacenada]':
				required: true
				regexp: /^[0-9]+\.?[0-9]*$/	
			'analisisregistro[cantidad_desechada]':
				required: true
				regexp: /^[0-9]+\.?[0-9]*$/																		
		messages:
			'analisisregistro[etiqueta_id]':
				required: 'Campo requerido'
			'analisisregistro[crematocrito]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros'
			'analisisregistro[kilocalorias]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros'
			'analisisregistro[proteinas]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros'
			'analisisregistro[carbohidratos]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros'
			'analisisregistro[grasas]':
				required: 'Campo requerido'
			'analisisregistro[clasificacion_id]':
				required: 'Campo requerido'
			'analisisregistro[cantidad_almacenada]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros o decimales'
			'analisisregistro[cantidad_desechada]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros o decimales'								
	

	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)		

$(document).ready(ready)
$(document).on('turbolinks:load',ready)