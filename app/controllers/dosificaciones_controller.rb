class DosificacionesController < ApplicationController
  before_action :authenticate_laboratorista!
  layout 'application_lab'
  
  before_action :set_dosificacion, only: [:show, :edit, :update, :destroy]

  # GET /dosificaciones
  # GET /dosificaciones.json
  def index
    @dosificaciones = Dosificacion.all.paginate(:page => params[:page], :per_page => 2)
  end

  # GET /dosificaciones/1
  # GET /dosificaciones/1.json
  def show
  end

  # GET /dosificaciones/new
  def new
    @dosificacion = Dosificacion.new
    @areas = Area.all
    @reciennacidos = Reciennacido.all
    @etiquetas = Etiqueta.where("formato_id = 3")
  end

  # GET /dosificaciones/1/edit
  def edit
    @areas = Area.all
    @reciennacidos = Reciennacido.all
    @etiquetas = Etiqueta.where("formato_id = 3")
  end

  # POST /dosificaciones
  # POST /dosificaciones.json
  def create
    @dosificacion = Dosificacion.new(dosificacion_params)

    respond_to do |format|
      if @dosificacion.save

         @etiqueta = Etiqueta.new

          etiquetaDosificacion = @dosificacion.etiqueta.etiqueta
          idDosificacion = @dosificacion.id
          idDosificacionString = idDosificacion.to_s

          @etiqueta.etiqueta = etiquetaDosificacion + idDosificacionString
          @etiqueta.formato_id = 4
          @etiqueta.save

        format.html { redirect_to etiqueta_mostrar_path(@etiqueta.id), notice: 'Dosificación registrada exitosamente.' }
       else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /dosificaciones/1
  # PATCH/PUT /dosificaciones/1.json
  def update
    respond_to do |format|
      if @dosificacion.update(dosificacion_params)
        format.html { redirect_to @dosificacion, notice: 'Dosificación actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @dosificacion }
      else
        format.html { render :edit }
        format.json { render json: @dosificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dosificaciones/1
  # DELETE /dosificaciones/1.json
  def destroy
    @dosificacion.destroy
    respond_to do |format|
      format.html { redirect_to dosificaciones_url, alert: 'Dosificación eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dosificacion
      @dosificacion = Dosificacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dosificacion_params
      params.require(:dosificacion).permit(:fecha_dosificacion, :dosificacion, :toma, :administracion, :reciennacido_id, :area_id, :etiqueta_id)
    end
end
