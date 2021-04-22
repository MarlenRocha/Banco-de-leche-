class TipousuariosController < ApplicationController
    before_action :authenticate_admin!
    
  def inicio
    values = {}
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
    end 
    
    if params[:salario].present?
      values[:salario] = params[:salario]
    end 
    if params[:rango].present?
      values[:rango] = params[:rango]
    end 
    if params[:seguro].present?
      values[:seguro] = params[:seguro]
    end 
    if params[:vacaciones].present?
      values[:vacaciones] = params[:vacaciones]
    end
  

    @tipousuarios = Tipousuario.where(values).paginate(:page => params[:page], :per_page => 2)
    
  end


  def nuevo
  	@tipousuario = Tipousuario.new
  end

  def crear
  	@tipousuario = Tipousuario.new(nombre: params[:tipousuario][:nombre], descripcion: params[:tipousuario][:descripcion], salario: params[:tipousuario][:salario], rango: params[:tipousuario][:rango], seguro: params[:tipousuario][:seguro], vacaciones: params[:tipousuario][:vacaciones]) 
	
	respond_to do |format|
		if @tipousuario.save
			format.html{ redirect_to tipousuarios_inicio_path, notice: 'Tipo de usuario creado existosamente.'}
		end
	end		
  end

  def mostrar
  	@tipousuario = Tipousuario.find(params[:id])
  end	

   def editar
    @tipousuario =  Tipousuario.find(params[:id])
  end

  def actualizar
    @tipousuario =  Tipousuario.find(params[:tipousuario][:id])

    respond_to do |format|
      if @tipousuario.update(params.require(:tipousuario).permit(:nombre, :descripcion, :salario, :rango, :seguro, :vacaciones))
        format.html{ redirect_to tipousuario_mostrar_path(@tipousuario.id), notice: 'Tipo de usuario actualizado existosamente.'}
      end
    end   
  end

  def eliminar
    @tipousuario =  Tipousuario.find(params[:id])
    respond_to do |format|
      if @tipousuario.destroy
        format.html{ redirect_to tipousuarios_inicio_path, alert: 'Tipo de usuario eliminado exitosamente.'}
      end
    end 
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(tipousuarios_inicio_path, alert: 'Este registro está asociado a un usuario, no puedes eliminarlo.')
  end

end
