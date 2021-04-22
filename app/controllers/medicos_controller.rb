class MedicosController < ApplicationController
    before_action :authenticate_admin!
  before_action :set_medico, only: [:show, :edit, :update, :destroy]

  # GET /medicos
  # GET /medicos.json
  

  def index
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
    if params[:edad].present?
      values[:edad] = params[:edad]
    end 
  

    @medicos = Medico.where(values).paginate(:page => params[:page], :per_page => 2)
    
  end


  # GET /medicos/1
  # GET /medicos/1.json
  def show
  end

  # GET /medicos/new
  def new
    @medico = Medico.new
    @especialidades = Especialidad.all
    @hospitales = Hospital.all
    @nacionalidades = Nacionalidad.all
  end

  # GET /medicos/1/edit
  def edit
    @especialidades = Especialidad.all
    @hospitales = Hospital.all
    @nacionalidades = Nacionalidad.all
  end

  # POST /medicos
  # POST /medicos.json
  def create
    @medico = Medico.new(medico_params)

    respond_to do |format|
      if @medico.save
        format.html { redirect_to @medico, notice: 'Médico ingresado exitosamente.' }
        format.json { render :show, status: :created, location: @medico }
      else
        format.html { render :new }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicos/1
  # PATCH/PUT /medicos/1.json
  def update
    respond_to do |format|
      if @medico.update(medico_params)
        format.html { redirect_to @medico, notice: 'Médico actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @medico }
      else
        format.html { render :edit }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicos/1
  # DELETE /medicos/1.json
  def destroy
    @medico.destroy
    respond_to do |format|
      format.html { redirect_to medicos_url, alert: 'Médico eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end
  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(medicos_path, alert: 'Este registro está asociado a un recien nacido, no puedes eliminarlo.')
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medico
      @medico = Medico.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medico_params
      params.require(:medico).permit(:nombre, :paterno, :materno, :sexo, :telefono, :edad, :especialidad_id, :hospital_id, :nacionalidad_id)
    end
end
