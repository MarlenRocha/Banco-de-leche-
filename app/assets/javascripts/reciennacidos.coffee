# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_reciennacidos').validate
		rules: 
			'reciennacido[curp]':
				required: true
				regexp: /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/
				remote:
					url: '/validar_curp_reciennacido'
					type: 'GET'
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false		
			'reciennacido[curpa]':
				required: true
				regexp: /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/				
			'reciennacido[nombre_madre]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'reciennacido[apellido_paterno_madre]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'reciennacido[apellido_materno_madre]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50			
			'reciennacido[edad_madre]':
				required: true
				regexp: /^[0-9]*$/
				min: 12
				max: 120
			'reciennacido[descripcion]':
				required: true
				minlength: 2
				maxlength: 100
			'reciennacido[peso]':
				required: true
				regexp: /^[0-9]+\.?[0-9]*$/
			'reciennacido[fecha_nacimiento]':
				required: true
				regexp: /^\d{4}([\-])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$/
			'reciennacido[altura]':
				required: true
				regexp: /^[0-9]*$/
			'reciennacido[enfermedad_id]':
				required: true
			'reciennacido[area_id]':
				required: true
			'reciennacido[medico_id]':
				required: true	
		messages:
			'reciennacido[curp]':	
				required: 'Campo requerido'
				regexp: 'CURP no válido'
				remote: 'EL CURP ya existe'	
			'reciennacido[curpa]':	
				required: 'Campo requerido'
				regexp: 'CURP no válido'
				remote: 'EL CURP ya existe'						
			'reciennacido[nombre_madre]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'reciennacido[apellido_paterno_madre]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'reciennacido[apellido_materno_madre]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'		
			'reciennacido[edad_madre]':	
				required: 'Campo requerido'
				regexp: 'Solo se aceptan numeros'
				min: 'Edad no valida'
				max:'Edad no valida'
			'reciennacido[descripcion]':
				required: 'Campo requerido'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 100 caracteres'
			'reciennacido[peso]':
				required: 'Campo requerido'
				regexp: 'Solo seaceptan números enteros o decimales'
			'reciennacido[fecha_nacimiento]':
				required: 'Campo requerido'
				regexp: 'Formato de fecha no válido'
			'reciennacido[altura]':
				required: 'Campo requerido'
				regexp: 'Solo se aceptan numeros'
			'reciennacido[enfermedad_id]':
				required: 'Campo requerido'
			'reciennacido[area_id]':
				required: 'Campo requerido'
			'reciennacido[medico_id]':
				required: 'Campo requerido'				

	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)						

$(document).ready(ready)
$(document).on('turbolinks:load',ready)