class MesasController < ApplicationController
  before_action :set_mesa, only: [:show, :edit, :update, :destroy]

#require 'rqrcode_png'
#require 'google-qr'

  # GET /mesas
  # GET /mesas.json

  def index
    @mesas = Mesa.search(params[:search], params[:page])
    #@mesas = Mesa.all
    #@mesas = Mesa.paginate(:page => params[:page], :per_page => 3)
    #codigo_qrcode = Mesa.where({codigo: "NOVOTESTE001"})
    #@qr = RQRCode::QRCode.new((codigo_qrcode).to_s).to_img.resize(90, 90).to_data_url
    #@qr = RQRCode::QRCode.new("").to_img.resize(90, 90).to_data_url
    #chart = GoogleQR.new(:data => "SomeDataToQRify", :size => "100x100", :margin => 4, :error_correction => "L")
    add_breadcrumb "Todas as Mesas", mesas_path, :title => "Back to the Index"
  end


  # GET /mesas/1
  # GET /mesas/1.json
  def show
    @mesas = Mesa.find(params[:id])
    add_breadcrumb "Todas as Mesas", mesas_path, :title => "Voltar para as Mesas"
    add_breadcrumb "Mesa " + (@mesas.id).to_s
  end

  # GET /mesas/new
  def new
    @mesa = Mesa.new
    add_breadcrumb "Todas as Mesas", mesas_path, :title => "Voltar para as Mesas"
    add_breadcrumb "Nova"
  end

  # GET /mesas/1/edit
  def edit
    @mesas = Mesa.find(params[:id])
    add_breadcrumb "Todas as Mesas", mesas_path, :title => "Voltar para as Mesas"
    add_breadcrumb "Mesa " + (@mesas.id).to_s
  end

  # POST /mesas
  # POST /mesas.json
  def create
    @mesa = Mesa.new(mesa_params)

    respond_to do |format|
      if @mesa.save
        format.html { redirect_to @mesa, notice: 'Mesa salva com sucesso.' }
        format.json { render :show, status: :created, location: @mesa }
      else
        format.html { render :new }
        format.json { render json: @mesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mesas/1
  # PATCH/PUT /mesas/1.json
  def update
    respond_to do |format|
      if @mesa.update(mesa_params)
        format.html { redirect_to @mesa, notice: 'Mesa atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @mesa }
      else 
        format.html { render :edit }
        format.json { render json: @mesa.errors, status: :unprocessable_entity }
      end
    end
    users = User.first_or_create
    if users.mesa_codigo.blank?
      reservar_mesa
    else
      cancelar_reserva
    end
  end

  def reservar_mesa
    users = User.first_or_create
    users.mesa_codigo = @mesa.codigo
    users.MesaId = @mesa.id
    users.save
  end


  def cancelar_reserva
    users = User.first_or_create
    users.mesa_codigo = nil
    users.MesaId = nil
    users.save
  end

  def checkin
    users = User.first_or_create
    users.checkin = @mesa.checkin
    users.save
  end

  # DELETE /mesas/1
  # DELETE /mesas/1.json
  def destroy
    @mesa.destroy
    respond_to do |format|
      format.html { redirect_to mesas_url, notice: 'Mesa excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mesa
      @mesa = Mesa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mesa_params
      params.require(:mesa).permit(:cadeiras, :codigo, :observacao, :reservada, :mesa_codigo, :MesaId, :num_acompanhante)
    end
  end
