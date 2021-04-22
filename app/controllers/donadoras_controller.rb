class DonadorasController < ApplicationController
   before_action :authenticate_enfermera!
   layout 'application_enf'
   
  def inicio
    values = {}
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
    end 
    if params[:paterno].present?
      values[:paterno] = params[:paterno]
    end 
    if params[:materno].present?
      values[:materno] = params[:materno]
    end 
    if params[:fecha_registro].present?
      values[:fecha_registro] = params[:fecha_registro]
    end 
    if params[:prueba_vih].present?
      values[:prueba_vih] = params[:prueba_vih]
    end 
    if params[:prueba_sifilis].present?
      values[:prueba_sifilis] = params[:prueba_sifilis]
    end 
    if params[:fecha_hepatitis].present?
      values[:fecha_hepatitis] = params[:fecha_hepatitis]
    end 
    if params[:drogas].present?
      values[:drogas] = params[:drogas]
    end 
  

    @donadoras = Donadora.where(values).paginate(:page => params[:page], :per_page => 2)
    
  end

  def nuevo
  	@donadora = Donadora.new
  end

  def crear
  	@donadora = Donadora.new(curp: params[:donadora][:curp], nombre: params[:donadora][:nombre], paterno: params[:donadora][:paterno], materno: params[:donadora][:materno], fecha_registro: params[:donadora][:fecha_registro], prueba_vih: params[:donadora][:prueba_sifilis], prueba_sifilis: params[:donadora][:prueba_sifilis], prueba_hepatitis: params[:donadora][:prueba_hepatitis], drogas: params[:donadora][:drogas]) 
	
	respond_to do |format|
		if @donadora.save
			format.html{ redirect_to donadora_mostrar_path(@donadora.id), notice: 'Donadora creada existosamente.'}
		end
	end		
  end

  def mostrar
  	@donadora = Donadora.find(params[:id])
  end	

  def editar
    @donadora =  Donadora.find(params[:id])
  end

  def actualizar
    @donadora =  Donadora.find(params[:donadora][:id])

    respond_to do |format|
      if @donadora.update(params.require(:donadora).permit(:curp, :nombre, :paterno, :materno, :fecha_registro, :prueba_vih, :prueba_sifilis, :prueba_hepatitis, :drogas))
        format.html{ redirect_to donadora_mostrar_path(@donadora.id), notice: 'Donadora actualizada existosamente.'}
      end
    end   
  end

  def eliminar
    @donadora =  Donadora.find(params[:id])
    respond_to do |format|
      if @donadora.destroy
        format.html{ redirect_to donadoras_inicio_path, alert: 'Donadora eliminada existosamente.'}
      end
    end 
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(donadoras_inicio_path, alert: 'Este registro está asociado a una donación, no puedes eliminarlo.')
  end

   def validar_curp
    @donadora = Donadora.where("curp = ?",params[:donadora][:curp]).first
    respond_to do |format|
      format.js{ render json: {validar: @donadora.nil? ? true : false }, content_type: 'text/json'}
    end  
  end
end
