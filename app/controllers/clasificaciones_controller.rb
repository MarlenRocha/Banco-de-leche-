class ClasificacionesController < ApplicationController
    before_action :authenticate_admin!

  def inicio
    values = {}
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
    end 
    if params[:color].present?
      values[:color] = params[:color]
    end 
    if params[:consistencia].present?
      values[:consistencia] = params[:consistencia]
    end 
    if params[:proteina].present?
      values[:proteina] = params[:proteina]
    end 
  

    @clasificaciones = Clasificacion.where(values).paginate(:page => params[:page], :per_page => 2)
    
  end

  def nuevo
  	@clasificacion = Clasificacion.new
  end

  def crear
  	@clasificacion = Clasificacion.new(nombre: params[:clasificacion][:nombre], descripcion: params[:clasificacion][:descripcion], color: params[:clasificacion][:color], consistencia: params[:clasificacion][:consistencia], proteina: params[:clasificacion][:proteina], cantidad: params[:clasificacion][:cantidad]) 
	
	respond_to do |format|
		if @clasificacion.save
			format.html{ redirect_to clasificaciones_inicio_path, notice: 'Clasificación creada existosamente.'}
		end
	end		
  end

  def mostrar
  	@clasificacion = Clasificacion.find(params[:id])
  end

  def editar
    @clasificacion =  Clasificacion.find(params[:id])
  end

  def actualizar
    @clasificacion =  Clasificacion.find(params[:clasificacion][:id])

    respond_to do |format|
      if @clasificacion.update(params.require(:clasificacion).permit(:nombre, :descripcion, :color, :consistencia, :proteina, :cantidad))
        format.html{ redirect_to clasificacion_mostrar_path(@clasificacion.id), notice: 'Clasificación actualizada existosamente.'}
      end
    end   
  end

  def eliminar
    @clasificacion = Clasificacion.find(params[:id])
    respond_to do |format|
      if @clasificacion.destroy
        format.html{ redirect_to clasificaciones_inicio_path, alert: 'Clasificación eliminada existosamente.'}
      end
    end 
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(clasificaciones_inicio_path, alert: 'Este registro está asociado a un registro, no puedes eliminarlo.')
  end

end
