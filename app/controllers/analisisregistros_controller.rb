class AnalisisregistrosController < ApplicationController
  before_action :authenticate_laboratorista!
  layout 'application_lab'
  before_action :set_analisisregistro, only: [:show, :edit, :update, :destroy]

  # GET /analisisregistros
  # GET /analisisregistros.json
  def index
    @analisisregistros = Analisisregistro.all.paginate(:page => params[:page], :per_page => 2)
  end

  # GET /analisisregistros/1
  # GET /analisisregistros/1.json
  def show
  end

  # GET /analisisregistros/new
  def new
    @analisisregistro = Analisisregistro.new
    @clasificaciones = Clasificacion.all
    @etiquetas = Etiqueta.where("formato_id = 1")
  end

  # GET /analisisregistros/1/edit
  def edit
    @clasificaciones = Clasificacion.all
    @etiquetas = Etiqueta.where("formato_id = 1")
  end

  # POST /analisisregistros
  # POST /analisisregistros.json
  def create
    @analisisregistro = Analisisregistro.new(analisisregistro_params)
        cantidadAlmacenada = @analisisregistro.cantidad_almacenada
        cantidadDesechada = @analisisregistro.cantidad_desechada

        @analisisregistro.cantidad = cantidadAlmacenada + cantidadDesechada 

        @almacenado = Almacenado.new
         @almacenado.cantidad = cantidadAlmacenada
         @almacenado.save
        @desechado = Desechado.new
         @desechado.cantidad = cantidadDesechada 
         @desechado.save 

    respond_to do |format|

      if @analisisregistro.save
        

        @etiqueta = Etiqueta.new

        etiquetaAnalisis = @analisisregistro.etiqueta.etiqueta
        idAnalisis = @analisisregistro.id
        idAnalisisString = idAnalisis.to_s

        @etiqueta.etiqueta = etiquetaAnalisis + idAnalisisString + "-"
        @etiqueta.formato_id = 2
        @etiqueta.save

        format.html { redirect_to etiqueta_mostrar_path(@etiqueta.id), notice: 'Análisis registrado exitosamente.' }
        format.json { render :show, status: :created, location: @analisisregistro }
      else
        format.html { render :new }
        format.json { render json: @analisisregistro.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /analisisregistros/1
  # PATCH/PUT /analisisregistros/1.json
  def update
    respond_to do |format|
      if @analisisregistro.update(analisisregistro_params)
        format.html { redirect_to @analisisregistro, notice: 'Análisis actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @analisisregistro }
      else
        format.html { render :edit }
        format.json { render json: @analisisregistro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analisisregistros/1
  # DELETE /analisisregistros/1.json
  def destroy
    @analisisregistro.destroy
    respond_to do |format|
      format.html { redirect_to analisisregistros_url, alert: 'Análisis eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analisisregistro
      @analisisregistro = Analisisregistro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def analisisregistro_params
      params.require(:analisisregistro).permit(:crematocrito, :kilocalorias, :proteinas, :carbohidratos, :grasas, :clasificacion_id, :cantidad_almacenada, :cantidad_desechada, :cantidad, :etiqueta_id)
    end
end
