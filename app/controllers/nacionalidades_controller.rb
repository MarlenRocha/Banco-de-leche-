class NacionalidadesController < ApplicationController
     before_action :authenticate_admin!
  before_action :set_nacionalidad, only: [:show, :edit, :update, :destroy]

  # GET /nacionalidades
  # GET /nacionalidades.json
 

  def index
    values = {}
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
    end 
    if params[:descripcion].present?
      values[:descripcion] = params[:descripcion]
    end 
    if params[:tipo].present?
      values[:tipo] = params[:tipo]
    end 
    if params[:espacio_geografico].present?
      values[:espacio_geografico] = params[:espacio_geografico]
    end 
    if params[:territorio].present?
      values[:territorio] = params[:territorio]
    end 
    if params[:pais_id].present?
      values[:pais_id] = params[:pais_id]
    end 
    
 

    @nacionalidades = Nacionalidad.where(values).paginate(:page => params[:page], :per_page => 2)
    @paises = Pais.all
  end

  # GET /nacionalidades/1
  # GET /nacionalidades/1.json
  def show
  end

  # GET /nacionalidades/new
  def new
    @nacionalidad = Nacionalidad.new
    @paises = Pais.all
  end

  # GET /nacionalidades/1/edit
  def edit
    @paises = Pais.all
  end

  # POST /nacionalidades
  # POST /nacionalidades.json
  def create
    @nacionalidad = Nacionalidad.new(nacionalidad_params)

    respond_to do |format|
      if @nacionalidad.save
        format.html { redirect_to @nacionalidad, notice: 'Nacionalidad creada exitosamente.' }
        format.json { render :show, status: :created, location: @nacionalidad }
      else
        format.html { render :new }
        format.json { render json: @nacionalidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nacionalidades/1
  # PATCH/PUT /nacionalidades/1.json
  def update
    respond_to do |format|
      if @nacionalidad.update(nacionalidad_params)
        format.html { redirect_to @nacionalidad, notice: 'Nacionalidad actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @nacionalidad }
      else
        format.html { render :edit }
        format.json { render json: @nacionalidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nacionalidades/1
  # DELETE /nacionalidades/1.json
  def destroy
    @nacionalidad.destroy
    respond_to do |format|
      format.html { redirect_to nacionalidades_url, alert: 'Nacionalidad eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(nacionalidades_path, alert: 'Este registro está asociado a un médico, no puedes eliminarlo.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nacionalidad
      @nacionalidad = Nacionalidad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nacionalidad_params
      params.require(:nacionalidad).permit(:nombre, :descripcion, :tipo, :espacio_geografico, :territorio, :pais_id)
    end


end
