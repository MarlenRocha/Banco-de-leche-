class AreasController < ApplicationController
    before_action :authenticate_admin!
  
  def inicio
    values = {}
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
    end 
    if params[:descripcion].present?
      values[:descripcion] = params[:descripcion]
    end 
    if params[:ubicacion].present?
      values[:ubicacion] = params[:ubicacion]
    end 
    if params[:existencia].present?
      values[:existencia] = params[:existencia]
    end 
    if params[:funcion].present?
      values[:funcion] = params[:funcion]
    end 
    if params[:cantidad].present?
      values[:cantidad] = params[:cantidad]
    end 
  

    @areas = Area.where(values).paginate(:page => params[:page], :per_page => 2)
    
  end

  def nuevo
  	@area = Area.new
  end

  def crear
  	@area = Area.new(nombre: params[:area][:nombre], descripcion: params[:area][:descripcion], ubicacion: params[:area][:ubicacion], existencia: params[:area][:existencia], funcion: params[:area][:funcion], cantidad: params[:area][:cantidad]) 
	
  	respond_to do |format|
  		if @area.save
  			format.html{ redirect_to areas_inicio_path, notice: 'Área creada existosamente.'}
  		end
  	end		
   
  end

  def mostrar
  	@area = Area.find(params[:id])
  end	
  def editar
    @area =  Area.find(params[:id])
  end

  def actualizar
    @area =  Area.find(params[:area][:id])

    respond_to do |format|
      if @area.update(params.require(:area).permit(:nombre, :descripcion, :ubicacion, :existencia, :funcion, :cantidad))
        format.html{ redirect_to area_mostrar_path(@area.id), notice: 'Área actualizada existosamente.'}
      end
    end   
  end

  def eliminar
    @area =  Area.find(params[:id])
    respond_to do |format|
      if @area.destroy
        format.html{ redirect_to areas_inicio_path, alert: 'Área eliminada existosamente.'}
      end
    end 
  end
  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(areas_inicio_path, alert: 'Este registro está asociado a otro, no puedes eliminarlo.')
  end

end
