class EnfermedadesController < ApplicationController

    before_action :authenticate_admin!
  before_action :set_enfermedad, only: [:show, :edit, :update, :destroy]

  # GET /enfermedades
  # GET /enfermedades.json
  

  def index
    values = {}
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
    end 
     if params[:tratamiento].present?
      values[:tratamiento] = params[:tratamiento]
    end 
     if params[:tipo].present?
      values[:tipo] = params[:tipo]
    end 
     if params[:clasificacion].present?
      values[:clasificacion] = params[:clasificacion]
    end 
     if params[:nueva].present?
      values[:nueva] = params[:nueva]
    end 
  

    @enfermedades = Enfermedad.where(values).paginate(:page => params[:page], :per_page => 2)
    
  end

  # GET /enfermedades/1
  # GET /enfermedades/1.json
  def show
  end

  # GET /enfermedades/new
  def new
    @enfermedad = Enfermedad.new
  end

  # GET /enfermedades/1/edit
  def edit
    
  end

  # POST /enfermedades
  # POST /enfermedades.json
  def create
    @enfermedad = Enfermedad.new(enfermedad_params)

    respond_to do |format|
      if @enfermedad.save
        format.html { redirect_to @enfermedad, notice: 'Enfermedad creada exitosamente.' }
        format.json { render :show, status: :created, location: @enfermedad }
      else
        format.html { render :new }
        format.json { render json: @enfermedad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enfermedades/1
  # PATCH/PUT /enfermedades/1.json
  def update
    respond_to do |format|
      if @enfermedad.update(enfermedad_params)
        format.html { redirect_to @enfermedad, notice: 'Enfermedad actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @enfermedad }
      else
        format.html { render :edit }
        format.json { render json: @enfermedad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enfermedades/1
  # DELETE /enfermedades/1.json
  def destroy
    @enfermedad.destroy
    respond_to do |format|
      format.html { redirect_to enfermedades_url, alert: 'Enfermedad eliminada exitosamente.' }
      format.json { head :no_content }
    
    end
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(enfermedades_path, alert: 'Este registro está asociado a un recien nacido, no puedes eliminarlo.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enfermedad
      @enfermedad = Enfermedad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enfermedad_params
      params.require(:enfermedad).permit(:nombre, :descripcion, :tratamiento, :tipo, :clasificacion, :nueva)
    end
end
