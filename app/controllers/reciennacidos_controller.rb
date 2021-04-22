class ReciennacidosController < ApplicationController
  before_action :authenticate_enfermera!
  layout 'application_enf'
  
  before_action :set_reciennacido, only: [:show, :edit, :update, :destroy]

  # GET /reciennacidos
  # GET /reciennacidos.json
 

  def index
    values = {}
    if params[:curp].present?
      values[:curp] = params[:curp]
    end 
    if params[:nombre_madre].present?
      values[:nombre_madre] = params[:nombre_madre]
    end 
    if params[:apellido_paterno_madre].present?
      values[:apellido_paterno_madre] = params[:apellido_paterno_madre]
    end 
     if params[:fecha_nacimiento].present?
      values[:fecha_nacimiento] = params[:fecha_nacimiento]
    end 
  

    @reciennacidos = Reciennacido.where(values).paginate(:page => params[:page], :per_page => 2)
    
  end

  # GET /reciennacidos/1
  # GET /reciennacidos/1.json
  def show
  end

  # GET /reciennacidos/new
  def new
    @reciennacido = Reciennacido.new
    @enfermedades = Enfermedad.all
    @areas = Area.all
    @medicos = Medico.all
  end

  # GET /reciennacidos/1/edit
  def edit
    @enfermedades = Enfermedad.all
    @areas = Area.all
    @medicos = Medico.all
  end

  # POST /reciennacidos
  # POST /reciennacidos.json
  def create
    @reciennacido = Reciennacido.new(reciennacido_params)

    respond_to do |format|
      if @reciennacido.save
        format.html { redirect_to @reciennacido, notice: 'Recién nacido creado exitosamente.' }
        format.json { render :show, status: :created, location: @reciennacido }
      else
        format.html { render :new }
        format.json { render json: @reciennacido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reciennacidos/1
  # PATCH/PUT /reciennacidos/1.json
  def update
    respond_to do |format|
      if @reciennacido.update(reciennacido_params)
        format.html { redirect_to @reciennacido, notice: 'Recién nacido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @reciennacido }
      else
        format.html { render :edit }
        format.json { render json: @reciennacido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reciennacidos/1
  # DELETE /reciennacidos/1.json
  def destroy
    @reciennacido.destroy
    respond_to do |format|
      format.html { redirect_to reciennacidos_url, alert: 'Recién nacido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(reciennacidos_path, alert: 'Este registro está asociado a otro, no puedes eliminarlo.')
  end

  def validar_curp
    @reciennacido = Reciennacido.where("curp = ?",params[:reciennacido][:curp]).first
    respond_to do |format|
      format.js{ render json: {validar: @reciennacido.nil? ? true : false }, content_type: 'text/json'}
    end  
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reciennacido
      @reciennacido = Reciennacido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reciennacido_params
      params.require(:reciennacido).permit(:curp, :nombre_madre, :apellido_paterno_madre, :apellido_materno_madre, :edad_madre, :descripcion, :peso, :fecha_nacimiento, :altura, :enfermedad_id, :area_id, :medico_id)
    end
end
