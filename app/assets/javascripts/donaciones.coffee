# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_donaciones').validate
		rules: 
			'donacion[tipo_donacion]':
				required: true	
			'donacion[fecha_registro_donacion]':
				required: true		
			'donacion[donadora_id]':
				required: true									
		messages:
			'donacion[tipo_donacion]':
				required: 'Campo requerido'
			'donacion[fecha_registro_donacion]':
				required: 'Campo requerido'
			'donacion[donadora_id]':
				required: 'Campo requerido'

	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)							

$(document).ready(ready)
$(document).on('turbolinks:load',ready)