class EtiquetadonacionesController < ApplicationController
	
	before_action :authenticate_enfermera!
	layout 'application_enf'

	
	def mostrar
		@etiqueta = Etiqueta.find(params[:id])
		#@frasco = Frasco.find(params[:id])
	end	
end
