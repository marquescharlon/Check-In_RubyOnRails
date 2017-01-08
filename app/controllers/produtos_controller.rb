class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  # GET /produtos
  # GET /produtos.json
  def index
    #@produtos = Produto.all
    @produtos = Produto.search(params[:search], params[:page])
    #@produtos = Produto.where(:publicado => true).paginate(:page => params[:page], :per_page => 3).order('updated_at DESC')
    #@produtos = Produto.paginate(:page => params[:page], :per_page => 3)
    #@produtos = Produto.limit(3).order "created_at DESC"
    #@produtos = Produto.order("created_at DESC")

    add_breadcrumb "Todos os produtos", produtos_path, :title => "Voltar para a Página principal"
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
    @produtos = Produto.find(params[:id])
    add_breadcrumb "Todos os produtos", produtos_path, :title => "Voltar para a Página principal"
    add_breadcrumb "Produto " + @produtos.nome
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
    add_breadcrumb "Todos os produtos", produtos_path, :title => "Voltar para a Página principal"
    add_breadcrumb "Novo"
  end

  # GET /produtos/1/edit
  def edit
    @produtos = Produto.find(params[:id])
    add_breadcrumb "Todos os produtos", produtos_path, :title => "Voltar para a Página principal"
    add_breadcrumb "Produto " + @produtos.nome
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.create(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto' + @produto.nome + ' salvo.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto' + @produto.nome + ' atualizado!' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto ' + @produto.nome + ' excluido!'  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:nome, :descricao, :tipo_id, :valor, :cupom, :publicado, :imagem)
    end
end
