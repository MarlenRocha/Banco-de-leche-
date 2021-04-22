class EspecialidadesController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_especialidad, only: [:show, :edit, :update, :destroy]

  # GET /especialidades
  # GET /especialidades.json
 
  
  def index
    values = {}
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
    end 
    if params[:descripcion].present?
      values[:descripcion] = params[:descripcion]
    end 
     if params[:orientacion].present?
      values[:orientacion] = params[:orientacion]
    end 
     if params[:agrupacion].present?
      values[:agrupacion] = params[:agrupacion]
    end 
     if params[:lugar].present?
      values[:lugar] = params[:lugar]
    end 
     if params[:anio].present?
      values[:anio] = params[:anio]
    end 
  

    @especialidades = Especialidad.where(values).paginate(:page => params[:page], :per_page => 2)
    
  end

  # GET /especialidades/1
  # GET /especialidades/1.json
  def show
  end

  # GET /especialidades/new
  def new
    @especialidad = Especialidad.new
  end

  # GET /especialidades/1/edit
  def edit
  end

  # POST /especialidades
  # POST /especialidades.json
  def create
    @especialidad = Especialidad.new(especialidad_params)

    respond_to do |format|
      if @especialidad.save
        format.html { redirect_to @especialidad, notice: 'Especialidad creada exitosamente.' }
        format.json { render :show, status: :created, location: @especialidad }
      else
        format.html { render :new }
        format.json { render json: @especialidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /especialidades/1
  # PATCH/PUT /especialidades/1.json
  def update
    respond_to do |format|
      if @especialidad.update(especialidad_params)
        format.html { redirect_to @especialidad, notice: 'Especialidad actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @especialidad }
      else
        format.html { render :edit }
        format.json { render json: @especialidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /especialidades/1
  # DELETE /especialidades/1.json
  def destroy
    @especialidad.destroy
    respond_to do |format|
      format.html { redirect_to especialidades_url, alert: 'Especialidad eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(especialidades_path, alert: 'Este registro está asociado a un médico, no puedes eliminarlo.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_especialidad
      @especialidad = Especialidad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def especialidad_params
      params.require(:especialidad).permit(:nombre, :descripcion, :orientacion, :agrupacion, :lugar, :anio)
    end
end
