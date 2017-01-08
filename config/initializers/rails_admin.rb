RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard  #do                  # mandatory
    #  statistics false
    #end
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    show
    edit
    delete
    history_show
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
#config.navigation_static_label = "My Links"
  #config.model 'tipo' do
  #  edit do
  #    field :nome
  #  end
  #  list do
  #    field :nome
  #  end
  #  field :nome
  #end



  # Adicionar um título (label) para o model Produto, que consequentimente é o pai dos
  # models Tipo e Mesa
  config.model 'Estabelecimento' do
    navigation_label 'Estabelecimento'
  end
  config.model 'Produto' do
    navigation_label 'Cardápio Online'
  end
  config.model 'Registro' do
    navigation_label 'DESENVOLVIMENTO'
  end


  

  # Para excluir os models do painel administrativo
  # config.excluded_models = ["Tipo","Mesa"]

  # Para incluir os models no painel administrativo
  # config.included_models = ["Tipo","Mesa"]

  # Definir parent entre os models
  # Os model Tipo é considerado filho do pai Produto
  # Excemplo:
  # Produto
  # -> Tipo

  config.model 'Tipo' do
    parent Produto
  end
  config.model 'Mesa' do
    parent Estabelecimento
  end

  # Define o título (label) para os links static
  config.navigation_static_label = "Acesso rápido"
  config.navigation_static_links = {
    'Página principal' => 'http://localhost:3000',
    'Mesas' => 'http://localhost:3000/mesas',
    'Produtos' => 'http://localhost:3000/produtos',
    'Tipos' => 'http://localhost:3000/tipos'
  }




end
