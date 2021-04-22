# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_donadoras').validate
		rules: 
			'donadora[curp]':
				required: true
				regexp: /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/
				remote:
					url: '/validar_curp_donadora'
					type: 'GET'
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'donadora[curpa]':
				required: true
				regexp: /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/				
			'donadora[nombre]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50	
			'donadora[paterno]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'donadora[materno]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'donadora[fecha_registro]':
				required: true
				regexp: /^\d{4}([\-])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$/
			'donadora[prueba_vih]':
				required: true
			'donadora[prueba_sifilis]':
				required: true
			'donadora[prueba_hepatitis]':
				required: true	
			'donadora[drogas]':
				required: true															
		messages:
			'donadora[curp]':
				required: 'Campo requerido'
				regexp: 'CURP no válido'
				remote: 'EL CURP ya existe'
			'donadora[curpa]':
				required: 'Campo requerido'
				regexp: 'CURP no válido'					
			'donadora[nombre]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'donadora[paterno]':	
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'	
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 100 caracteres'
			'donadora[materno]':
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'donadora[fecha_registro]':
				required: 'Campo requerido'
				regexp: 'Formato de fecha no válido'
			'donadora[prueba_vih]':
				required: 'Campo requerido'
			'donadora[prueba_sifilis]':
				required: 'Campo requerido'
			'donadora[prueba_hepatitis]':
				required: 'Campo requerido'
			'donadora[drogas]':
				required: 'Campo requerido'		

	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value.toUpperCase())
	)						

$(document).ready(ready)
$(document).on('turbolinks:load',ready)