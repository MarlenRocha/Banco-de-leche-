class ApplicationController < ActionController::Base

	before_action :login?


	def login?
		
		redirect_to login_path, alert: "Debes iniciar sesión." if session[:usuario_id].nil?
	end	


	protected
  	def authenticate_admin!
	   unless session[:usuario_id].present? && session[:tipousuario_id] == 1 
			 respond_to do |format|	
	         flash[:notice] = "No tienes autorización para entrar en esa sección"
			         if session[:tipousuario_id] == 2
			         	format.html{ redirect_to donadoras_inicio_path}
			         else
			         	if session[:tipousuario_id] == 3
			         		format.html{ redirect_to recepciones_path}
			         end	
             	end
	        end
  		end	
    end

    def authenticate_enfermera!
			unless session[:usuario_id].present? && session[:tipousuario_id] == 2 
			 respond_to do |format|	
	         flash[:notice] = "No tienes autorización para entrar en esa sección"
			         if session[:tipousuario_id] == 1
			         	format.html{ redirect_to usuarios_path}
			         else
			         	if session[:tipousuario_id] == 3
			         		format.html{ redirect_to recepciones_path}
			         end	
             	end
	        end
  		end	
    end

    def authenticate_laboratorista!
		unless session[:usuario_id].present? && session[:tipousuario_id] == 3 
			 respond_to do |format|	
	         flash[:notice] = "No tienes autorización para entrar en esa sección"
			         if session[:tipousuario_id] == 1
			         	format.html{ redirect_to usuarios_path}
			         else
			         	if session[:tipousuario_id] == 2
			         		format.html{ redirect_to donadoras_inicio_path}
			         end	
             	end
	        end
  		end	
    end


    	

end

