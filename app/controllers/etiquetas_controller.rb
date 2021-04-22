class EtiquetasController < ApplicationController
	 before_action :authenticate_laboratorista!

	layout 'application_lab'

	
	def mostrar
		@etiqueta = Etiqueta.find(params[:id])
		#@frasco = Frasco.find(params[:id])
	end	
	
	
end
