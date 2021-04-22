class PruebasController < ApplicationController
  before_action :set_prueba, only: [:show, :edit, :update, :destroy]

  # GET /pruebas
  # GET /pruebas.json
  def index
    @pruebas = Prueba.all
  end

  # GET /pruebas/1
  # GET /pruebas/1.json
  def show
  end

  # GET /pruebas/new
  def new
    @prueba = Prueba.new
    @clasificaciones = Clasificacion.all
    @etiquetas = Etiqueta.where("formato_id = 1")
  end

  # GET /pruebas/1/edit
  def edit
    @clasificaciones = Clasificacion.all
    @etiquetas = Etiqueta.all
  end

  # POST /pruebas
  # POST /pruebas.json
  def create
    @prueba = Prueba.new(prueba_params)

      cantidadAlmacenada = @prueba.cantidad_almacenada
        cantidadDesechada = @prueba.cantidad_desechada

        @prueba.cantidad = cantidadAlmacenada + cantidadDesechada 

    respond_to do |format|
      if @prueba.save

        @etiqueta = Etiqueta.new

        etiquetaAnalisis = @prueba.etiqueta.etiqueta
        idAnalisis = @prueba.id
        idAnalisisString = idAnalisis.to_s

        @etiqueta.etiqueta = etiquetaAnalisis + idAnalisisString + "-"
        @etiqueta.formato_id = 2
        @etiqueta.save

        format.html { redirect_to etiqueta_mostrar_path(@etiqueta.id), notice: 'Prueba was successfully created.' }
        format.json { render :show, status: :created, location: @prueba }
      else
        format.html { render :new }
        format.json { render json: @prueba.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pruebas/1
  # PATCH/PUT /pruebas/1.json
  def update
    respond_to do |format|
      if @prueba.update(prueba_params)
        format.html { redirect_to @prueba, notice: 'Prueba was successfully updated.' }
        format.json { render :show, status: :ok, location: @prueba }
      else
        format.html { render :edit }
        format.json { render json: @prueba.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pruebas/1
  # DELETE /pruebas/1.json
  def destroy
    @prueba.destroy
    respond_to do |format|
      format.html { redirect_to pruebas_url, notice: 'Prueba was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prueba
      @prueba = Prueba.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prueba_params
      params.require(:prueba).permit(:embalaje, :color, :suciedad, :olor, :crematocrito, :kilocalorias, :proteinas, :carbohidratos, :grasas, :clasificacion_id, :cantidad_almacenada, :cantidad_desechada, :etiqueta_id, :cantidad)
    end
end
