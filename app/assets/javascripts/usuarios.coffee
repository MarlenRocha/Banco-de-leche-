# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = -> 
	validator = $('#formulario_usuarios').validate
		rules: 
			'usuario[rfc]':
				required: true
				regexp: /^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])([A-Z]|[0-9]){2}([A]|[0-9]){1})?$/
				remote:
					url: '/validar_rfc'
					type: 'GET'
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'usuario[rfca]':
				required: true
				regexp: /^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])([A-Z]|[0-9]){2}([A]|[0-9]){1})?$/			
			'usuario[curp]':
				required: true
				regexp: /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/
				remote:
					url: '/validar_curp'
					type: 'GET'
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'usuario[nombre]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'usuario[paterno]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'usuario[materno]':
				required: true
				regexp: /^[A-Za-zÑñ\s]+$/
				minlength: 2
				maxlength: 50
			'usuario[edad]':
				required: true
				regexp: /^[0-9]*$/
				min: 0
				max: 120
			'usuario[telefono]':
				required: true
				regexp: /^[0-9]*$/
				minlength: 10
				maxlength: 10
			'usuario[correo]':
				required: true
				regexp: /^[a-zA-Z0-9-.!#$%&'*+/=?^_{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/ 
			'usuario[fecha_nacimiento]':
				required: true
				regexp: /^\d{4}([\-])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$/	
			'usuario[sexo]':
				required: true		
			'usuario[login]':
				required: true
				regexp: /^[\w]+$/
				minlength: 3
				maxlength: 15
			'usuario[password]':
				required: true
				regexp: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}/
			'usuario[tipousuario_id]':
				required: true
			'usuario[hospital_id]':
				required: true													
		messages:
			'usuario[rfc]':
				required: 'Campo requerido'
				regexp: 'RFC no válido'
				remote: 'El RFC ya existe'
			'usuario[rfca]':
				required: 'Campo requerido'
				regexp: 'RFC no válido'
			'usuario[curp]':	
				required: 'Campo requerido'
				regexp: 'CURP no válido'
				remote: 'EL CURP ya existe'	
			'usuario[nombre]':
				required: 'Campo requerido'	
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 caracteres'
				maxlength: 'Maximo 50 caracteres'
			'usuario[paterno]':	
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 carácteres'
				maxlength: 'Maximo 50 carácteres'
			'usuario[materno]':	
				required: 'Campo requerido'
				regexp: 'Sólo se aceptan letras'
				minlength: 'Minimo 2 cáracteres'
				maxlength: 'Maximo 50 cáracteres'
			'usuario[edad]':
				required: 'Campo requerido'
				regexp: 'Solo se aceptan números'
				min: 'Edad no válida'
				max:'Edad no válida'
			'usuario[telefono]':
				required: 'Campo requerido'
				regexp: 'Solo se aceptan números'
				minlength: 'Teléfono no valido'
				maxlength: 'Teléfono no valido'
			'usuario[correo]':
				required: 'Campo requerido'
				regexp: 'Correo no valido'
			'usuario[fecha_nacimiento]':
				required: 'Campo requerido'
				regexp: 'Formato de fecha no válido'
			'usuario[sexo]':
				required: 'Campo requerido'
			'usuario[login]':
				required: 'Campo requerido'
				regexp: 'Nombre de usuario no valido'
				minlength: 'Mínimo 3 carácteres'
				maxlength: 'Máximo 15 carácteres'
			'usuario[password]':
				required: 'Campo requerido'
				regexp: 'Debes tener al menos una letra mayuscula, una letra minuscula, un dígito, un caracter especial, sin espacios y entre 8 y 15 carácteres'
			'usuario[tipousuario_id]':
				required: 'Campo requerido'
			'usuario[hospital_id]':
				required: 'Campo requerido'		
				
										
	$.validator.addMethod("regexp",(value,element,regexp) ->
		return this.optional(element) || regexp.test(value)
	)				

$(document).ready(ready)
$(document).on('turbolinks:load',ready)