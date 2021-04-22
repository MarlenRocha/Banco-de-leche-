class DonacionesController < ApplicationController
  before_action :authenticate_enfermera!
  layout 'application_enf'
  before_action :set_donacion, only: [:show, :edit, :update, :destroy]

  # GET /donaciones
  # GET /donaciones.json
  def index
    values = {}
    if params[:fecha_registro_donacion].present?
      values[:fecha_registro_donacion] = params[:fecha_registro_donacion]
    end 
    
   
     
  

    @donaciones = Donacion.where(values).paginate(:page => params[:page], :per_page => 2)
    
  end

  # GET /donaciones/1
  # GET /donaciones/1.json
  def show
  end

  # GET /donaciones/new
  def new
    @donacion = Donacion.new
    @donadoras = Donadora.all
  end

  # GET /donaciones/1/edit
  def edit
    @donadoras = Donadora.all
  end

  # POST /donaciones
  # POST /donaciones.json
  def create

    @donacion = Donacion.new(donacion_params)
    
    respond_to do |format|
    if @donacion.save
       @frasco = Frasco.new
       @frasco.donacion_id = @donacion.id
       @frasco.save

  
       @etiqueta = Etiqueta.new
       idDonadora = @frasco.donacion.donadora.id
       idDonadoraString = idDonadora.to_s
       idFrasco = @frasco.id
       idFrascoString = idFrasco.to_s
       @etiqueta.etiqueta = idDonadoraString + "-" + @frasco.donacion.fecha_registro_donacion.strftime("%m") + idFrascoString + "-"
       @etiqueta.formato_id = 1
       @etiqueta.save


      format.html{ redirect_to etiquetadonacion_mostrar_path(@etiqueta.id), notice: 'Donación creada exitosamente.'}
    end 
  end 

  end

  # PATCH/PUT /donaciones/1
  # PATCH/PUT /donaciones/1.json
  def update
    respond_to do |format|
      if @donacion.update(donacion_params)
        format.html { redirect_to @donacion, notice: 'Donación actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @donacion }
      else
        format.html { render :edit }
        format.json { render json: @donacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donaciones/1
  # DELETE /donaciones/1.json
  def destroy
    @donacion.destroy
    respond_to do |format|
      format.html { redirect_to donaciones_url, notice: 'Donación eliminada correctamente.' }
      format.json { head :no_content }
    end
  end
  
  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to(donaciones_path, alert: 'Este registro está asociado a una frasco, no puedes eliminarlo.')
  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donacion
      @donacion = Donacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donacion_params
      params.require(:donacion).permit(:fecha_registro_donacion, :donadora_id, :tipo_donacion)
    end
   

end
