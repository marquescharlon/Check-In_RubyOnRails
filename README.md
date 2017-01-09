# O que é?

<p align="justify">É um sistema cujo objetivo é ganhar tempo ao realizar uma reserva de uma mesa em um estabelecimento. Além de servir como apoio para aqueles que estiverem começando aprender a programar em Ruby. Todas as dificuldades, erros e soluções foram documentadas no próprio sistema, com isso, podendo servir como base de conhecimento. No entanto, logo abaixo você irá encontrar uma lista de erros que ocorreram durante o desenvolvimento e suas soluções.</p>

### Trabalho de Conclusão de Curso

**Tema:** Desenvolvimento de Sistema para realização de reserva de uma mesa em estabelecimentos e check-in, com base na metodologia ágil.<br>
**Aluno:** Marquescharlon Santos<br>
**Curso:** Bacharel em Sistemas de Informação<br>
**Orientador:** Thiago Medeiros<br>
**Instituição:** Faculdade Única de Ipatinga / MG<br>

> Caso lhe seja útil, estou disponibilizando para consulta o trabalho final de meu TCC.<br>
Para isso, clique [aqui](https://raw.githubusercontent.com/marquescharlon/check-in_ruby_tcc/master/public/docs/TCC_CHECK-IN_MARQUESCHARLON.pdf).

### Assista o vídeo mostrando como funciona:

[![CHECK-IN DE MESA](https://raw.githubusercontent.com/marquescharlon/check-in_ruby_tcc/master/public/images/check-in_youtube.JPG)](https://www.youtube.com/watch?v=yJKiZyIY3YE)

### Detalhes

- Ruby version: ```ruby 2.2.4p230 (2015-12-16 revision 53155) [x64-mingw32]```
- Sistema Operacional: ```Windows 7 Ultimate 64bit```

### Ferramentas utilizadas

- RubyInstaller 2.2.4-x64;
- DevKit-mingw64-64-4.7.2-20130224-1432-sfx;
- Ruby On Rails v4.2.3;
- Sublime Text v3;
- Twitter Bootstrap Rails v3;
- MySQL v5.7.12.0;
- Métodos Ágeis: Extreme Programming (XP);

# Por onde começo?

**Para utilizar o projeto em sua máquina será necessário seguir os seguintes passos:**

1. Instalação "MySQL, Ruby e DevKit"
2. Configuração do DevKit
3. Instalação do Rails e Bundle
4. Executar o sistema

> Para aqueles que ainda estão começando a desenvolver seu primeiro sistema utilizando o Ruby e seu framework RubyOnRails, por favor, leiam a apostila: [Desenv. Ágil para Web com Ruby on Rails](https://www.caelum.com.br/apostila-ruby-on-rails/) e [Rails Crash Course](https://www.nostarch.com/railscrashcourse).

# 1. Instalação "MySQL, Ruby e DevKit"

- Clique [aqui](https://dev.mysql.com/downloads/mysql/) para baixar o MySQL, faça a instalação.
- Clique [aqui](https://rubyinstaller.org/downloads/) para baixar o Ruby versão => 2.2.4. 
<br>Fique atento também quanto a versão do seu Sistema Operacional, se é 32 ou 64 bit.
- Agora é só aplicar o velho next, next e finish.

# 2. Configuração do DevKit

- No mesmo [site](https://rubyinstaller.org/downloads/) baixe o DevKit, cuja versão corresponda ao seu Sistema Operacional.
- Extrair o DevKit ```DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe``` para o diretório ```(C:/Devkit/)```;
- Abrir o Prompt(Modo Administrador) e acessar o diretório do DevKit (C:/Devkit/);
- Executar o comando: ```ruby dk.rb init```;
- Verificar se no arquivo ```config.yml``` (C:/Devkit/) possui o conteúdo ```C:/Ruby22-x64```;
- Executar o comando: ```ruby dk.rb install```;

**Testar se o JSON está funcionando**

1. Abrir o Prompt(Modo Administrador) e acessar o diretório do Ruby ```(C:/Ruby22-x64)```;
2. Executar o comando: ```gem install json --platform=ruby```, se abrir uma janela pedindo permissão você clicará em "Permitir acesso";
3. Executar o comando: ```ruby -rubygems -e "require 'json'; puts JSON.load('[42]').inspect"``` para confirmar que o Json está funcionando;

# 3. Instalação do Rails e Bundle

- Abrir o Prompt(Modo Administrador) e acessar o diretório do Ruby ```(C:/Ruby22-x64)```;
- Executar o comando: ```gem install rails``` e aguarde, demora um pouco mesmo;
- Depois, execute o comando ```bundle install```;

# 4. Executar o sistema

- Abrir o Prompt(Modo Administrador) e acessar o diretório do projeto;
- Executar o comando: ```rails s``` e aguardar até o servidor ser iniciado por completo;
- Abra o navegador e acesse o endereço [http://localhost:3000/](http://localhost:3000/);
- Pronto! O sistema ```Qro Check-in de Mesa``` será carregado.

# Erros, dificuldades e soluções

### 1. Botão Excluir/Delete não funciona

Isso foi logo após gerar o meu primeiro projeto, os botoes **New** e **Edit** funcionavam, porém, o botão **Delete** não. A solução foi instalar o [node-v4.4.5-x86](https://raw.githubusercontent.com/marquescharlon/check-in_ruby_tcc/master/public/apps/node-v4.4.5-x86.msi), após a instalação o meu funcionou. Talvez fosse por falta de alguma biblioteca.

**Observação:**
<br>Tentei outras versões, porém, só essa é que deu certo.

### 2. config/initializers/rails_admin.rb
	
- Adicionar um título (label) para o model Produto, que consequentimente é o pai dos models Tipo e Mesa:
 ```tex
config.model 'Mesa' do
  navigation_label 'Estabelecimento'
end
config.model 'Produto' do
	navigation_label 'Cardápio Online'
end
config.model 'Registro' do
	navigation_label 'DESENVOLVIMENTO'
end

# Para excluir os models do painel administrativo
config.excluded_models = ["Tipo","Mesa"]

# Para incluir os models no painel administrativo
config.included_models = ["Tipo","Mesa"]

# Definir parent entre os models
O model Tipo é considerado filho do pai Produto. Excemplo:

Produto
-> Tipo

config.model 'Tipo' do
  parent Produto
end

# Define o título (label) para os links static
config.navigation_static_label = "Acesso rápido"
config.navigation_static_links = {
   'Página principal' => 'http://localhost:3000',
   'Mesas' => 'http://localhost:3000/mesas',
   'Produtos' => 'http://localhost:3000/produtos',
'Tipos' => 'http://localhost:3000/tipos'
}
 ```

**Referências:**
<br>[https://github.com/sferik/rails_admin/wiki](https://github.com/sferik/rails_admin/wiki)
<br>[https://github.com/sferik/rails_admin/wiki/Navigation](https://github.com/sferik/rails_admin/wiki/Navigation)

### 3. Instalando gem 'will_paginate'

- gem 'will_paginate', '~> 3.1'
- bundle install
- No controller produtos troca o comando: 
```tex
@produtos = Produto.all
```
por:
```tex
@produtos = Produto.where(:publicado => true).paginate(:page => params[:page], :per_page => 3).order('updated_at DESC')
```

**Referência:**
<br>[https://github.com/mislav/will_paginate](https://github.com/mislav/will_paginate)

- Adicionar o comando ```<%= will_paginate @produtos%>``` na página index da view produtos.

**PARA USAR AS FORMATAÇÕES DO BOOTSTRAP BASTA APENAS:**
- gem 'will_paginate-bootstrap'
- bundle install
- Na view index de produtos trocar o comando 
```tex
<%= will_paginate @produtos%>
```
por: 
```tex 
<%= will_paginate @produtos, renderer: BootstrapPagination::Rails %>
```

**Erro/Solução:**
<br>O Rails_admin acusou o seguinte ```erro: undefined method per for #<Produto::ActiveRecord_Relation:0x0000000cec26e0>```
<p align="justify">
Conflito ao utilizar o will_pagination. Para solucionar este problema foi necessário apenas adicionar um novo arquivo cujo caminho e o nome será ```config/initializers/kaminari.rb```, dentro deste arquivo adicione o seguinte bloco de comandos para definirmos um novo caminho:
</p>
```tex
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end
```

**Referências:**
<br>[https://github.com/bootstrap-ruby/will_paginate-bootstrap](https://github.com/bootstrap-ruby/will_paginate-bootstrap)
<br>[https://github.com/sferik/rails_admin/issues/1420](https://github.com/sferik/rails_admin/issues/1420)
<br>[https://github.com/sferik/rails_admin/wiki/Troubleshoot](https://github.com/sferik/rails_admin/wiki/Troubleshoot)

### 4. Configurar o botão Pesquisar/Buscar produto
	
Foi necessário criar um método dentro do model produtos:

```tex
def self.search(search, page)
    order('id')
    .where(:publicado => true)
    .where('id LIKE ? or nome LIKE ? or descricao LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    .paginate(page: page, per_page: 3)
    .order('created_at DESC')
  end
```
Depois, no controller "ProdutosController" foi necessário trocar o comando:
```tex
@produtos = Produto.where(:publicado => true).paginate(:page => params[:page], :per_page => 3).order('updated_at DESC')
```
por:
```tex
@produtos = Produto.search(params[:search], params[:page]).
```
Por último, foi necessário criar a ação para o formulário de busca localizado em ```app/views/layouts/application.html.erb```. Deixando o formulário como o exemplo abaixo:
```tex
<form class="navbar-form navbar-left">
   <div class="form-group">
      <%= form_tag({}, {:method => :get}) do %>
      <%= text_field_tag :search, params[:search], :class=> "form-control", :placeholder=> "Digite aqui" %>
   </div>
      <%= submit_tag("Buscar", :id=>"button", :class=>"btn btn-default", :name=>"submit") %>
   <% end %>
</form>
```
**Observação:**
<br>O comando ```.where(:publicado => true)``` é para trazer apenas produtos que estejam marcados como publicado pelo administrador.

### 5. Breadcrumb para rails

Para adicionar o breadcrumb é necessário instalar a gem:

- gem "breadcrumbs_on_rails"
- bundle install
- Adicionar no ```app/controllers/application_controller.rb``` o comando abaixo, para definir o caminho para a página principal em todas as páginas.

```tex
add_breadcrumb "Página principal", :root_path, :options => { :title => "Página principal" } 
```
- Adicionar no index de cada controller (ProdutosController) o comando:
```tex
add_breadcrumb "Produto", produtos_path, :title => "Voltar para a Página principal"
```
- Adicionar no Body da página "app/views/layouts/application.html.erb" o comando:
```tex
<ol class="breadcrumb">
  <%= render_breadcrumbs :tag => :li, :separator => "" %>
</ol>
```
**Observação:**
<p align="justify">Como não preparei ainda minha página principal eu deixei o caminho para produtos_path em ```app/controllers/application_controller.rb```, porém, quando finalizar a página principal não esqueça de alterar o caminho do path.</p>

Para o breadcrumb aparecer nas páginas **show**, **new** e **edit** foi preciso adicionar os seguintes comandos em cada um deles:
```tex
# GET /produtos/1
# GET /produtos/1.json
def show
@produtos = Produto.find(params[:id])
add_breadcrumb "Produto", produtos_path, :title => "Voltar para a Página principal"
add_breadcrumb @produtos.nome
end

# GET /produtos/new
def new
@produto = Produto.new
add_breadcrumb "Produto", produtos_path, :title => "Voltar para a Página principal"
add_breadcrumb "Novo"
end

# GET /produtos/1/edit
def edit
@produtos = Produto.find(params[:id])
add_breadcrumb "Produto", produtos_path, :title => "Voltar para a Página principal"
add_breadcrumb "Editando " + @produtos.nome
end
```

E em index continuou os mesmos comandos:
```tex
add_breadcrumb "Produto", produtos_path, :title => "Voltar para a Página principal"
```

**Referência:**
<br>[https://github.com/weppos/breadcrumbs_on_rails](https://github.com/weppos/breadcrumbs_on_rails)

### 6. Validando Model Mesa
```tex
validates :codigo, :presence => true, 
exclusion: { in: %w(Mesa MESA mesa mesa1 mesa01 mesa0001),
message: "%{value} não é permitido por questões de segurança. 
Sugerimos que escolha um código que não seja fácil para o usuário descobrir. Por exemplo, DIADOSPAIS150.
Porém, fica a seu critério qual código usar considerando que seja seguro." }, 
uniqueness: { case_sensitive: false },
length: { minimum: 8, maximum: 20}
```
**Observação:**
<br>Irá encontrar mais validações para o model na documentação do próprio Ruby On Rails, links na descrição.

**Referências:**
<br>[http://guides.rubyonrails.org/active_record_validations.html](http://guides.rubyonrails.org/active_record_validations.html)
<br>[http://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html](http://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html)

### 7. Video como background da página principal

- Adicionar a estrutura na página principal (app/views/pages/index.html.erb):
```tex
<video poster="" id="bgvid" playsinline autoplay muted loop>
<!-- <source src="http://thenewcode.com/assets/videos/polina.webm" type="video/webm"> -->
<!-- <source src="http://thenewcode.com/assets/videos/polina.mp4" type="video/mp4"> -->
<source src="videos/teste.mp4" type="video/mp4">
</video>
<div class="container">
<!-- Conteúdo aqui -->
</div>
```
- Adicionar o estilo no arquivo (app/assets/stylesheets/pages.scss):
```tex
video { 
    position: fixed;
    top: 50%;
    left: 50%;
    min-width: 100%;
    min-height: 100%;
    width: auto;
    height: auto;
    z-index: -100;
    transform: translateX(-50%) translateY(-50%);
 background: url('') no-repeat;
  background-size: cover;
  transition: 1s opacity;
}
```
### 8. Adicionando Login na página principal

Adicionar os códigos abaixo na página principal (app/views/pages/index.html.erb):
```tex
<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-7">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-lock"></span> Login</div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">
                                        Email</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="inputEmail3" placeholder="Email" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3 control-label">
                                            Senha</label>
                                            <div class="col-sm-9">
                                                <input type="password" class="form-control" id="inputPassword3" placeholder="Senha" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox"/>
                                                        Lembrar-me
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group last">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button type="submit" class="btn btn-success btn-sm">
                                                    Entrar</button>
                                                    <button type="reset" class="btn btn-default btn-sm">
                                                        Limpar</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="panel-footer">
                                            Não possui uma conta? <a href="#">Crie agora</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
```
**Observação:**
<br>Ainda falta adicionar a GEM e criar as sessões, esse é só um preview. 

### 9. Definir Porta Padrão para rodar o projeto Ruby On Rails
	
Em ```config/boot.rb```, adicione o seguinte bloco de comando:
```tex
require 'rails/commands/server'
module Rails
  class Server
    alias :default_options_alias :default_options
    def default_options
      default_options_alias.merge!(:Port => 3000)
    end
  end
end
```
**Observação:**
<br>Onde está ```(:Port => 3000)```, você pode definir a porta que for preciso.

### 10. Gemfile / gem "font-awesome-rails"

- Adicionar gem "font-awesome-rails";
- Bundle install
- Adicionar o comando abaixo:
(app/assets/stylesheets/applications.css.scss)
```tex
/*
 *= require font-awesome
 */
@import "font-awesome";
```
- Necessário apenas iniciar o servidor (rails s).

**Observação:**
<br>Para utilizar no **index.html.erb** necessário apenas adicionar a tag ```<i class=" "></i>```, e definir sua classe com o nome do icone desejado, por exemplo, ```<i class="fa fa-bell"></i>```.

**Referências:**
<br>[https://github.com/bokmann/font-awesome-rails](https://github.com/bokmann/font-awesome-rails)
<br>[http://fontawesome.io/examples/](http://fontawesome.io/examples/)
<br>[http://fontawesome.io/icons/](http://fontawesome.io/icons/)

### 11. Erro: Rake aborted!
```tex
C:\Users\CHARLON\Dropbox\UNICA\TCC\qro>rake db:migrate
rake aborted!
Gem::LoadError: You have already activated rake 11.3.0, but your Gemfile require
s rake 11.2.2. Prepending `bundle exec` to your command may solve this.
C:/Users/CHARLON/Dropbox/UNICA/TCC/qro/config/boot.rb:3:in `<top (required)>'
C:/Users/CHARLON/Dropbox/UNICA/TCC/qro/config/application.rb:1:in `<top (required)>'
C:/Users/CHARLON/Dropbox/UNICA/TCC/qro/Rakefile:4:in `<top (required)>'
LoadError: cannot load such file -- bundler/setup
C:/Users/CHARLON/Dropbox/UNICA/TCC/qro/config/boot.rb:3:in `<top (required)>'
C:/Users/CHARLON/Dropbox/UNICA/TCC/qro/config/application.rb:1:in `<top (required)>'
C:/Users/CHARLON/Dropbox/UNICA/TCC/qro/Rakefile:4:in `<top (required)>'
(See full trace by running task with --trace)
```
**Observação:**
<br>Foi necessário apenas excluir o arquivo ```Gemfile.lock```, logo em seguida executar o ```rake db:migrate```.

### 12. Formatar :decimal (R$ 00,00)

Para apresentar os valores com esta formatação na view é necessário criar um método no helper. Segue abaixo o método:

- Adicionar no helper, no meu caso, por exemplo, ProdutosHelper:
```tex
def valor_decimal(x)
    x = number_to_currency(x, unit: "R$", separator: ",", delimiter: "")
end
```
- Adicionar na view, no meu caso, por exemplo, (app/views/produtos/index.html.erb):
```tex
<%= valor_decimal(produto.valor) %>
```
**Observação:**
<br>É só acessar a documentação para verificar outras formatações.

**Referência:**
<br>[http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html#method-i-number_to_currency](http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html#method-i-number_to_currency)

### 13. Error: Server certificate B: certificate verify failed - certificado

Descrição completa do erro:
```tex
Gem::RemoteFetcher::FetchError: SSL_connect returned=1 errno=0 state=SSLv3 read
server certificate B: certificate verify failed
(https://rubygems.org/gems/rake-11.3.0.gem)
An error occurred while installing rake (11.3.0), and Bundler cannot continue.
Make sure that `gem install rake -v '11.3.0'` succeeds before bundling.
```

<p align="justify">Isso é devido a atualização realizada pela RubyGems que visa melhorar na comunicação entre seus servidores na hora de baixar as gems, visando principalmente a segurança. Para isso, deixaram a documentação disponível para que possamos realizar todas as correções possíveis.</p> 

<p align="justify">Infelizmente, demorei achar a solução devido estar aprendendo sozinho, testei várias possibilidades, até mesmo disponibilizado pela própria empresa Ruby, mas só depois de dois dias batalhando, além de ter que reinstalar o windows (por ter corrompido com alguma coisa, é coisa de windows, certo!).</p> 

1. Visite o endereço: [https://rubygems.org/pages/download#formats](https://rubygems.org/pages/download#formats)
2. Fazer o download ZIP.
3. Extrair o conteúdo. Dentro da pasta rubygems-x.y.z execute o comando Ruby setup.rb.
4. Pronto! Como realizei uma nova instalação foi preciso apenas testar o Devkit e instalar o json e bundler.
5. Já que possuo o projeto e dentro o arquivo GEMFILE, no qual, possui a relação de todas dependências (gems) do projeto. Então, necessário apenas acessar o projeto pelo prompt e executar o comando ```bundler install```.

**Documentaçao DevKit:**
<br>[https://github.com/oneclick/rubyinstaller/wiki/Development-Kit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit)

### 14. Gemfile / gem 'devise'

- gem 'devise'
- bundle install
- rails g devise:install
- Acessar o arquivo ```config/environments/development.rb``` e definir a porta padrão: 
```tex
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
- Acessar o arquivo ```app/views/layouts/application.html.erb``` e adicionar o conteúdo abaixo antes de <%= yield %>:
```tex
<% if notice %>
  <p class="alert alert-success"><%= notice %></p>
<% end %>
<% if alert %>
  <p class="alert alert-danger"><%= alert %></p>
<% end %>
```
- Acessar o arquivo ```app/views/ideas/show.html.erb``` e remover a linha ```<p id="notice"><%= notice %></p>```.
Fazer o mesmo para os demais arquivos.
- Gerar o model User: ```rails g devise user```
- rake db:migrate
- Basta acessar o caminho [http://localhost:3000/users/sign_up](http://localhost:3000/users/sign_up) e realizar o teste criando um usuário.
- Para adicionar notificações basta abrir o arquivo ```app/views/layouts/application.html.erb``` e adicionar o conteúdo abaixo logo depois da barra de menus ```<ul class="nav">```:
```tex
<p class="navbar-text pull-right">
<% if user_signed_in? %>
  Logged in as <strong><%= current_user.email %></strong>.
  <%= link_to 'Edit profile', edit_user_registration_path, :class => 'navbar-link' %> |
  <%= link_to "Logout", destroy_user_session_path, method: :delete, :class => 'navbar-link'  %>
<% else %>
  <%= link_to "Sign up", new_user_registration_path, :class => 'navbar-link'  %> |
  <%= link_to "Login", new_user_session_path, :class => 'navbar-link'  %>
<% end %>
```
- Acessar o arquivo ```app/controllers/application_controller.rb``` e adicionar o código abaixo, não esquecer que deve ser logo após o comando ```protect_from_forgery with: :exception```:

```tex
before_action :authenticate_user!
```
**Referências:**
<br>[https://github.com/plataformatec/devise](https://github.com/plataformatec/devise)
<br>[http://guides.railsgirls.com/devise](http://guides.railsgirls.com/devise)

### 15. Gemfile / gem "paperclip"

- Instalar [ImageMagick-6.9.4-8-Q16-HDRI-x64-dll](https://raw.githubusercontent.com/marquescharlon/check-in_ruby_tcc/master/public/apps/ImageMagick-6.9.4-8-Q16-HDRI-x64-dll.exe);
- Instalar [file-5.03-setup](https://raw.githubusercontent.com/marquescharlon/check-in_ruby_tcc/master/public/apps/file-5.03-setup.exe);
- Para realizar a configuração, clique [aqui](https://github.com/thoughtbot/paperclip);

**Erro/Solução:**
<br>Mesmo após ter feito a instalação da forma correta, o sistema não estava querendo enviar o anexo, foi necessário instalar o [node-v4.4.5-x86](https://raw.githubusercontent.com/marquescharlon/check-in_ruby_tcc/master/public/apps/node-v4.4.5-x86.msi), após a instalação o meu funcionou. Talvez fosse por falta de alguma biblioteca. 

> No meu caso, a instalação do ```node-v4.4.5-x86``` foi feita ainda no início do projeto, pois, o botão ```Delete``` não estava funcionando.

# CONCLUSÃO

<p align="justify">Conclui-se que, este projeto atende uma das necessidades encontradas em um estabelecimento, que é a reserva de uma mesa. Em alguns casos submetendo o cliente a uma fila absurda e obrigando-o a esperar sem nenhum conforto até que alguma mesa esteja desocupada. Para o desenvolvimento deste sistema foi necessário enfrentar diversos desafios, entre eles está a própria linguagem de programação utilizada (Ruby), ainda sendo nova no mercado e pouca discutida em ambientes acadêmicos. Outros métodos que estão adquirindo espaço no mercado aos poucos são os métodos ágeis, utilizados neste trabalho para proporcionar o desenvolvimento em um tempo hábil. O sistema apresentado neste trabalho oferece a possibilidade de realizar a reserva da mesa online. Há a necessidade apenas de realizar o check-in na entrada do estabelecimento, pois, um pré-cadastro já foi realizado pelo próprio cliente. Assim como é feita a reserva de uma passagem aérea, tal qual, é realizada online e tendo em vista seu check-in antes do embarque, também será a reserva e o check-in da mesa. Isso proporciona não só conforto, mas a segurança de que ao chegar no estabelecimento será atendido sem a necessidade de enfrentar filas, pois, o seu cadastro já foi feito e a mesa já está reservada.<p>