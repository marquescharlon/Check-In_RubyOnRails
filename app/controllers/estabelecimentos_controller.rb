class EstabelecimentosController < ApplicationController
  before_action :set_estabelecimento, only: [:show, :edit, :update, :destroy]

  # GET /estabelecimentos
  # GET /estabelecimentos.json
  def index
    @estabelecimentos = Estabelecimento.all
  end

  # GET /estabelecimentos/1
  # GET /estabelecimentos/1.json
  def show
  end

  # GET /estabelecimentos/new
  def new
    @estabelecimento = Estabelecimento.new
  end

  # GET /estabelecimentos/1/edit
  def edit
  end

  # POST /estabelecimentos
  # POST /estabelecimentos.json
  def create
    @estabelecimento = Estabelecimento.new(estabelecimento_params)

    respond_to do |format|
      if @estabelecimento.save
        format.html { redirect_to @estabelecimento, notice: 'Estabelecimento was successfully created.' }
        format.json { render :show, status: :created, location: @estabelecimento }
      else
        format.html { render :new }
        format.json { render json: @estabelecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estabelecimentos/1
  # PATCH/PUT /estabelecimentos/1.json
  def update
    respond_to do |format|
      if @estabelecimento.update(estabelecimento_params)
        format.html { redirect_to @estabelecimento, notice: 'Estabelecimento was successfully updated.' }
        format.json { render :show, status: :ok, location: @estabelecimento }
      else
        format.html { render :edit }
        format.json { render json: @estabelecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estabelecimentos/1
  # DELETE /estabelecimentos/1.json
  def destroy
    @estabelecimento.destroy
    respond_to do |format|
      format.html { redirect_to estabelecimentos_url, notice: 'Estabelecimento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estabelecimento
      @estabelecimento = Estabelecimento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estabelecimento_params
      params.require(:estabelecimento).permit(:CNPJ, :InscEstadual, :RazaoSocial, :NomeFantasia, :CEP, :cIdade, :UF, :CodigoMunicipalIbge, :Logradouro, :Bairro, :Numero, :Complemento, :TelefoneFixo, :Celular, :Email, :Observacao)
    end
end
