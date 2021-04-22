class PasteurizacionesController < ApplicationController
  before_action :authenticate_laboratorista!
  layout 'application_lab'
  before_action :set_pasteurizacion, only: [:show, :edit, :update, :destroy]
  

  # GET /pasteurizaciones
  # GET /pasteurizaciones.json
  def index
    @pasteurizaciones = Pasteurizacion.all.paginate(:page => params[:page], :per_page => 2)
  end

  # GET /pasteurizaciones/1
  # GET /pasteurizaciones/1.json
  def show
  end

  # GET /pasteurizaciones/new
  def new
    @pasteurizacion = Pasteurizacion.new
    @etiquetas = Etiqueta.where("formato_id = 2")
  end

  # GET /pasteurizaciones/1/edit
  def edit
    @etiquetas = Etiqueta.where("formato_id = 2")
  end

  # POST /pasteurizaciones
  # POST /pasteurizaciones.json
  def create
    @pasteurizacion = Pasteurizacion.new(pasteurizacion_params)

        cantidadAlmacenada = @pasteurizacion.cantidad_almacenada
        cantidadDesechada = @pasteurizacion.cantidad_desechada

        @pasteurizacion.cantidad = cantidadAlmacenada + cantidadDesechada

         @almacenado = Almacenado.new
         @almacenado.cantidad = cantidadAlmacenada
         @almacenado.save
        @desechado = Desechado.new
         @desechado.cantidad = cantidadDesechada 
         @desechado.save 

    respond_to do |format|
      if @pasteurizacion.save

          @etiqueta = Etiqueta.new

          etiquetaPasteurizacion = @pasteurizacion.etiqueta.etiqueta
          idPasteurizacion = @pasteurizacion.id
          idPasteurizacionString = idPasteurizacion.to_s

          @etiqueta.etiqueta = etiquetaPasteurizacion + idPasteurizacionString + "-"
          @etiqueta.formato_id = 3
          @etiqueta.save

        format.html { redirect_to etiqueta_mostrar_path(@etiqueta.id), notice: 'Pasteurización registrada exitosamente.' }
      end
    end
  end

  # PATCH/PUT /pasteurizaciones/1
  # PATCH/PUT /pasteurizaciones/1.json
  def update
    respond_to do |format|
      if @pasteurizacion.update(pasteurizacion_params)
        format.html { redirect_to @pasteurizacion, notice: 'Pasteurización actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @pasteurizacion }
      else
        format.html { render :edit }
        format.json { render json: @pasteurizacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasteurizaciones/1
  # DELETE /pasteurizaciones/1.json
  def destroy
    @pasteurizacion.destroy
    respond_to do |format|
      format.html { redirect_to pasteurizaciones_url, alert: 'Pasteurización eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pasteurizacion
      @pasteurizacion = Pasteurizacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pasteurizacion_params
      params.require(:pasteurizacion).permit(:pasteurizacion, :etiqueta_id, :cantidad_almacenada, :cantidad_desechada, :acidez_dornic, :cantidad)
    end
end
