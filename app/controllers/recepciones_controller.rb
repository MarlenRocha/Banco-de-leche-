class RecepcionesController < ApplicationController

before_action :authenticate_laboratorista!
layout 'application_lab'

  before_action :set_recepcion, only: [:show, :edit, :update, :destroy]

  # GET /recepciones
  # GET /recepciones.json
  def index

    values = {}
    if params[:fecha_extraccion].present?
      values[:fecha_extraccion] = params[:fecha_extraccion]
    end 

    @recepciones = Recepcion.where(values).paginate(:page => params[:page], :per_page => 2)
  end

  # GET /recepciones/1
  # GET /recepciones/1.json
  def show
  end

  # GET /recepciones/new
  def new
    @recepcion = Recepcion.new
    @areas = Area.all
    @frascos = Frasco.all
  end

  # GET /recepciones/1/edit
  def edit
    @areas = Area.all
    @frascos = Frasco.all
  end

  # POST /recepciones
  # POST /recepciones.json
  def create
    @recepcion = Recepcion.new(recepcion_params)

    respond_to do |format|
      if @recepcion.save
         
        format.html { redirect_to @recepcion, notice: 'Recepción creada exitosamente.' }
        format.json { render :show, status: :created, location: @recepcion }
      else
        format.html { render :new }
        format.json { render json: @recepcion.errors, status: :unprocessable_entity }
      end
    end

     

  end

  # PATCH/PUT /recepciones/1
  # PATCH/PUT /recepciones/1.json
  def update
    respond_to do |format|
      if @recepcion.update(recepcion_params)
        format.html { redirect_to @recepcion, notice: 'Recepción actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @recepcion }
      else
        format.html { render :edit }
        format.json { render json: @recepcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recepciones/1
  # DELETE /recepciones/1.json
  def destroy
    @recepcion.destroy
    respond_to do |format|
      format.html { redirect_to recepciones_url, alert: 'Recepción eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recepcion
      @recepcion = Recepcion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recepcion_params
      params.require(:recepcion).permit(:fecha_extraccion, :cantidad, :frasco_id, :area_id)
    end
end
