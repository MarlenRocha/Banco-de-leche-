class UsuariosController < ApplicationController
  before_action :authenticate_admin!
  
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    values = {}
    if params[:rfc].present?
      values[:rfc] = params[:rfc]
    end 
    if params[:curp].present?
      values[:curp] = params[:curp]
    end 
    if params[:nombre].present?
      values[:nombre] = params[:nombre]
    end 
    if params[:paterno].present?
      values[:paterno] = params[:paterno]
    end 
    if params[:materno].present?
      values[:materno] = params[:materno]
    end 

    @usuarios = Usuario.where(values).paginate(:page => params[:page], :per_page => 2)
    respond_to do |format|
      format.html
      format.pdf{
        send_data reporte_pdf(values), filename: "reporte_usuarios_pdf", type: "aplication/pdf", disposition: :attachment
      }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
    @tipousuarios = Tipousuario.all
    @hospitales = Hospital.all
  end

  # GET /usuarios/1/edit
  def edit
   @tipousuarios = Tipousuario.all
   @hospitales = Hospital.all
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario creado existosamente.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario actualizado existosamente.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, alert: 'Usuario eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  def validar_rfc
    @usuario = Usuario.where("rfc = ?",params[:usuario][:rfc]).first
    respond_to do |format|
      format.js{ render json: {validar: @usuario.nil? ? true : false }, content_type: 'text/json'}
    end  
  end 

  def validar_curp
    @usuario = Usuario.where("curp = ?",params[:usuario][:curp]).first
    respond_to do |format|
      format.js{ render json: {validar: @usuario.nil? ? true : false }, content_type: 'text/json'}
    end  
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:rfc, :curp, :nombre, :paterno, :materno, :edad, :telefono, :correo, :fecha_nacimiento, :sexo, :login, :password, :tipousuario_id, :hospital_id)
    end

   def reporte_pdf(values)
    @usuarios = Usuario.where(values).order('paterno')

    pdf = Prawn::Document.new

    #encabezado
    pdf.repeat(:all) do 
      pdf.font_size 7
      pdf.draw_text "#{l(Time.now,format: '%d de %B %Y')}", :at => [pdf.bounds.right - 80,pdf.bounds.bottom - 4]
      pdf.font_size 6
      pdf.draw_text "SISTEMA DE ADMINISTRACION", at: [pdf.bounds.right - 140,pdf.bounds.top + 10]
    end  

    pdf.move_down 55
    pdf.font_size 10
    pdf.text "Usuarios", align: :center, style: :bold
    pdf.move_down 10
    pdf.font_size 6


    #cuerpo
    encabezado=[]
    datos=[]

    pdf.bounding_box([0,650],width: pdf.bounds.width) do
      encabezado = [["#","RFC", "CURP","NOMBRE","PATERNO","MATERNO","EDAD","TELEFONO","CORREO", "FECHA DE NACIMIENTO", "SEXO", "ESTADO", "LOGIN"]]
      i=0
      datos = @usuarios.collect { |usua|
        i+=1
        [i,usua.rfc,usua.curp,usua.nombre,usua.paterno,usua.materno,usua.edad,usua.telefono,usua.correo,usua.fecha_nacimiento,usua.sexo,usua.tipousuario_id]

      }
    end

    pdf.table encabezado.concat(datos), position: :center do
      row(0).border_width= 2
      row(0).font_style= :bold
      row(0).align= :center
    end

    #pie de pagina
    pdf.font_size=7
    pdf.number_pages "Pag. <page>/<total>",{at: [0,pdf.bounds.bottom],width: pdf.bounds.width,align: :center, font_size: 7}

    pdf.render

    end
end
