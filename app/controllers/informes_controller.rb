class InformesController < ApplicationController
 before_action :authenticate_admin!

 
	def ver_informe

		@almacenados = Almacenado.sum(:cantidad)
		@desechados = Desechado.sum(:cantidad)
		@donadoras = Donadora.count
		@donaciones = Donacion.count
		@reciennacidos = Reciennacido.count
		reciennacidoString= @reciennacidos.to_s
			
	

	    respond_to do |format|
	    	format.html
	    	format.pdf do
	    		pdf = Prawn::Document.new
	    		pdf.font_size 10
		        pdf.draw_text "#{l(Time.now,format: '%d - %B - %Y')}", :at => [pdf.bounds.right - 80,pdf.bounds.bottom - 4]
		        pdf.font_size 10
		        pdf.draw_text "Gobierno del Estado de México", at: [pdf.bounds.right - 140,pdf.bounds.top + 10]

		        pdf.move_down 55
    			pdf.font_size 20
    			pdf.text "Cordinación Estatal de Lactancia y Bancos de Leche", align: :center, style: :bold, :color => "5A6523"
   				pdf.move_down 10
   		 		pdf.font_size 15
   		 		pdf.text "Informe de productividad Estatal de Lactancia Materna y Banco de Leche", align: :center, style: :bold, :color => "972323"
   		 		pdf.font_size 20
   		 		pdf.text "________________________________________________", align: :center, style: :bold, :color => "5A6523"
   		 		pdf.move_down 60
   		 		pdf.font_size 12
   		 		pdf.text "INFORMACIÓN DE LA UNIDAD HOSPITALARIA", align: :left, style: :bold
   		 		pdf.move_down 10
   		 		pdf.font_size 10
   		 		pdf.text "Entidad federativa:", align: :left, style: :bold
   		 		pdf.draw_text "Estado de México", at: [pdf.bounds.right - 444,pdf.bounds.top - 222]
   		 		pdf.move_down 6
   		 		pdf.text "Nombre de la unidad hospitalaria:", align: :left, style: :bold
   		 		pdf.draw_text "Hospital Materno Perinatal Monica Pretelini Sáenz", at: [pdf.bounds.right - 375,pdf.bounds.top - 240]
   		 		pdf.move_down 6
   		 		pdf.text "Responsable del banco de leche humana:", align: :left, style: :bold
   		 		pdf.draw_text session[:nombre], at: [pdf.bounds.right - 336,pdf.bounds.top - 257]

   		 		
   		 			  

   		 		
				

   		 		 pdf.bounding_box([80,450],width: pdf.bounds.width) do

 				  pdf.move_down 55
			      pdf.table([ ["Total de donadoras registradas", "Total de donaciones", "Total de bebés beneficiados"],
   		 				[@donadoras, @donaciones, @reciennacidos ] ])

			    end
   		 		

			    pdf.bounding_box([105,350],width: pdf.bounds.width) do

			      

			      pdf.move_down 55
			      pdf.table ([ ["Cantidad de leche almacenada(ml)","Cantidad de leche desechada(ml)"],
   		 				[@almacenados, @desechados ] ]) 
			        
			    end

   				

   		 		

   		 		pdf.move_down 85
   		 		pdf.font_size 10
   		 		pdf.text "____________________________", align: :center
   		 		pdf.move_down 5
   		 		pdf.font_size 10
   		 		pdf.text "Autorizó", align: :center
   		 		pdf.move_down 5
   		 		pdf.font_size 10
   		 		pdf.text "Director del hospital", align: :center			

	    		send_data pdf.render,
	    			filename: "informe_estatal.pdf",
	    			type: 'aplication/pdf',
	    			disposition: 'inline'
	    	end
	    end	
	end    
	

end
