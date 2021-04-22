# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_dosificaciones').validate
		rules: 
			'dosificacion[fecha_dosificacion]':
				required: true
			'dosificacion[dosificacion]':
				required: true
				regexp: /^[0-9]+\.?[0-9]*$/	
			'dosificacion[toma]':
				required: true
				regexp: /^[0-9]*$/
			'dosificacion[administracion]':
				required: true
				regexp: /^[0-9]+\.?[0-9]*$/											
			'dosificacion[reciennacido_id]':
				required: true	
			'dosificacion[area_id]':
				required: true	
			'dosificacion[etiqueta_id]':
				required: true			
		messages:
			'dosificacion[fecha_dosificacion]':
				required: 'Campo requerido'
			'dosificacion[dosificacion]':	
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros o decimales'
			'dosificacion[toma]':	
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros'	
			'dosificacion[administracion]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan números enteros o decimales'
			'dosificacion[reciennacido_id]':
				required: 'Campo requerido'				
			'dosificacion[area_id]':
				required: 'Campo requerido'
			'dosificacion[etiqueta_id]':
				required: 'Campo requerido'		
											
		

$(document).ready(ready)
$(document).on('turbolinks:load',ready)