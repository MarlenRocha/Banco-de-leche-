class SesionesController < ApplicationController
  
  layout 'application_login'
  skip_before_action :login?, only: [:login, :validar_usuario]

  def login
  end


  def validar_usuario
  	@usuario = Usuario.select('id,nombre,paterno,materno,login,password,tipousuario_id,hospital_id').where('login = ? and password = ?', params[:login], params[:password]).first
  	if @usuario.nil?
  		validar = false
  	else
  		validar = true
      session[:usuario_id] = @usuario.id
      session[:nombre] = @usuario.nombre+' '+@usuario.paterno+' '+@usuario.materno
      session[:tipousuario_id]= @usuario.tipousuario_id
  	end	
  	respond_to do |format|
  			if validar && session[:tipousuario_id] == 1
          flash[:notice] = 'Usuario válido.'
          format.html{ redirect_to usuarios_path}
          else 
            if validar && session[:tipousuario_id] == 2 
            flash[:notice] = 'Usuario válido.'
            format.html{ redirect_to donadoras_inicio_path}
            else 
              if validar && session[:tipousuario_id] == 3 
              flash[:notice] = 'Usuario válido.'
              format.html{ redirect_to recepciones_path} 

              else
                flash[:alert] = 'Usuario/contraseña no válido.'
                format.html{ redirect_to login_path}
              end
            end
        end   		
  	end
  end

  def cerrar_sesion
      session[:usuario_id] = nil
      session[:nombre] = nil
      respond_to do |format|
        flash[:alert] = 'Sesión finalizada.'
        format.html{redirect_to login_path}
      end
  end 
end


