class HospitalesController < ApplicationController
    before_action :authenticate_admin!

  def inicio
    values = {}
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
    end 
    if params[:estado_id].present?
      values[:estado_id] = params[:estado_id]
    end 
  

    @hospitales = Hospital.where(values).paginate(:page => params[:page], :per_page => 2)
    @estados = Estado.all
    
  end

  def nuevo
  	@hospital = Hospital.new
    @estados = Estado.all
  end

  def crear
  	@hospital = Hospital.new(nombre: params[:hospital][:nombre], descripcion: params[:hospital][:descripcion], telefono: params[:hospital][:telefono], direccion: params[:hospital][:direccion], estado_id: params[:hospital][:estado_id], correo: params[:hospital][:correo]) 
	
	respond_to do |format|
		if @hospital.save
			format.html{ redirect_to hospital_mostrar_path(@hospital.id), notice: 'Hospital creado existosamente.'}
		end
	end		
  end

  def mostrar
  	@hospital = Hospital.find(params[:id])
  end	

  def editar
    @hospital =  Hospital.find(params[:id])
    @estados = Estado.all
  end

  def actualizar
    @hospital =  Hospital.find(params[:hospital][:id])

    respond_to do |format|
      if @hospital.update(params.require(:hospital).permit(:nombre, :descripcion, :telefono, :direccion, :estado_id, :correo))
        format.html{ redirect_to hospital_mostrar_path(@hospital.id), notice: 'Hospital actualizado existosamente.'}
      end
    end   
  end

  def eliminar
    @hospital =  Hospital.find(params[:id])
    respond_to do |format|
      if @hospital.destroy
        format.html{ redirect_to hospitales_inicio_path, alert: 'Hospital eliminado existosamente.'}
      end
    end 
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(hospitales_inicio_path, alert: 'Este registro está asociado a otro registro, no puedes eliminarlo.')
  end

end
