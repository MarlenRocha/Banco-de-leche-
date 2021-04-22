# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_recepciones').validate
		rules: 
			'recepcion[fecha_extraccion]':
				required: true
				regexp: /^\d{4}([\-])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$/
			'recepcion[cantidad]':
				required: true
				regexp: /^[0-9]+\.?[0-9]*$/
			'recepcion[frasco_id]':
				required: true
			'recepcion[area_id]':
				required: true										
		messages:
			'recepcion[fecha_extraccion]':
				required: 'Campo requerido'
				regexp: 'Formato de fecha no válido'
			'recepcion[cantidad]':	
				required: 'Campo requerido'
				regexp: 'Solo se aceptan números enteros o decimales'
			'recepcion[frasco_id]':	
				required: 'Campo requerido'	
			'recepcion[area_id]':
				required: 'Campo requerido'
				
										
	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)	

$(document).ready(ready)
$(document).on('turbolinks:load',ready)