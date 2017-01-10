-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.12-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema qro_development
--

CREATE DATABASE IF NOT EXISTS qro_development;
USE qro_development;

--
-- Definition of table `estabelecimentos`
--

DROP TABLE IF EXISTS `estabelecimentos`;
CREATE TABLE `estabelecimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InscEstadual` int(11) DEFAULT NULL,
  `RazaoSocial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NomeFantasia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CEP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cIdade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CodigoMunicipalIbge` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Logradouro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Bairro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Complemento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TelefoneFixo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Celular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Observacao` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `estabelecimentos`
--

/*!40000 ALTER TABLE `estabelecimentos` DISABLE KEYS */;
INSERT INTO `estabelecimentos` (`id`,`CNPJ`,`InscEstadual`,`RazaoSocial`,`NomeFantasia`,`CEP`,`cIdade`,`UF`,`CodigoMunicipalIbge`,`Logradouro`,`Bairro`,`Numero`,`Complemento`,`TelefoneFixo`,`Celular`,`Email`,`Observacao`,`created_at`,`updated_at`) VALUES 
 (1,'35.099.000/0001-00',9990099,'HORTO PIZZARIA LTDA','HORTO PIZZARIA','35160000','Ipatinga','MG','','Rua Caviúna','Horto',0,'Ao lado do posto de gasolina','(31) 3600-0000','(31) 98888-9999','hortopizza@gmail.com','','2016-10-29 07:18:00','2016-10-29 07:18:00');
/*!40000 ALTER TABLE `estabelecimentos` ENABLE KEYS */;


--
-- Definition of table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
CREATE TABLE `mesas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cadeiras` int(11) DEFAULT '1',
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reservada` tinyint(1) DEFAULT NULL,
  `checkin` tinyint(1) DEFAULT NULL,
  `realizado_at` datetime DEFAULT NULL,
  `observacao` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mesas`
--

/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` (`id`,`cadeiras`,`codigo`,`reservada`,`checkin`,`realizado_at`,`observacao`,`created_at`,`updated_at`) VALUES 
 (1,4,'DIADOSPAIS01',0,0,NULL,'Pode adicionar mais cadeiras se necessário.','2016-11-03 18:00:34','2016-12-30 19:48:49'),
 (2,6,'MESA0002',1,0,'2016-11-03 18:04:00','Está mesa está localizada mais no fundo do estabelecimento, mas não tem o que se preocupar, o local é bem iluminado e ainda possui ar-condicionado. Portanto, é uma ótima mesa para aqueles que querem privacidade. Conta com uma mesa de 4x1m, cadeiras confortáveis e muito mais. Aproveite! ','2016-11-03 18:01:00','2017-01-02 21:50:08'),
 (3,4,'MESA0001',0,0,NULL,'Está mesa é apropriada para até dois casais, iluminação mais romântica, com cadeiras bem confortáveis.','2016-11-03 18:01:23','2016-12-08 13:01:22'),
 (4,5,'NOVOTESTE001',0,0,NULL,'Esta mesa esta localizada mais próxima da porta.','2016-11-03 18:01:44','2016-11-14 18:03:21'),
 (5,4,'OUTUBRO2016',0,0,NULL,'Mesa próxima a entrada.','2016-11-03 18:02:18','2016-11-03 18:02:18'),
 (6,8,'MESAEXECUTIVA',0,0,NULL,'Essa mesa possui um tamanho de 6x1m.','2016-11-03 18:02:38','2016-11-03 18:02:38');
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;


--
-- Definition of table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8_unicode_ci,
  `tipo_id` int(11) DEFAULT NULL,
  `valor` decimal(5,2) DEFAULT '0.00',
  `cupom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publicado` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `imagem_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagem_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagem_file_size` int(11) DEFAULT NULL,
  `imagem_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_produtos_on_tipo_id` (`tipo_id`),
  CONSTRAINT `fk_rails_4d8c8cd8a9` FOREIGN KEY (`tipo_id`) REFERENCES `tipos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `produtos`
--

/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`id`,`nome`,`descricao`,`tipo_id`,`valor`,`cupom`,`publicado`,`created_at`,`updated_at`,`imagem_file_name`,`imagem_content_type`,`imagem_file_size`,`imagem_updated_at`) VALUES 
 (1,'PIZZA 4 QUEIJOS','Molho, Mussarela, Provolone, Parmesão, Catupiry, Tomate, Pimentão, Cebola, Azeitona e Orégano',2,'30.00','',1,'2016-09-11 06:29:41','2016-09-13 05:04:31','modadacasa.jpg','image/jpeg',176776,'2016-09-13 05:04:28'),
 (2,'BACON','Massa fina, molho, mussarela, bacon, tomate, orégano e azeitonas.',2,'35.00','',1,'2016-09-12 21:40:06','2016-09-13 05:04:16','modadacasa.jpg','image/jpeg',176776,'2016-09-13 05:04:13'),
 (3,'CALABRESA','Massa fina, molho, calabresa fatiada, cebolas salpicado c/ provolone, orégano e azeitonas.',4,'35.00','',1,'2016-09-13 00:16:18','2016-09-30 04:24:35','modadacasa.jpg','image/jpeg',176776,'2016-09-13 05:03:59'),
 (4,'MODA DA CASA','Massa fina, mussarela, presunto, ervilha, milho, bacon, frango, catupiry, cebola e azeitonas.',2,'35.00','',1,'2016-09-13 02:55:46','2016-09-13 23:57:55','bacon.jpg','image/jpeg',614895,'2016-09-13 23:57:50'),
 (6,'PIZZA HAVAIANA ','Massa, creme de leite, mussarela, abacaxi com açúcar, canela e leite condensado.',2,'40.00','',1,'2016-09-13 23:22:25','2016-11-01 00:46:24','pizza-havaiana.jpg','image/jpeg',199780,'2016-11-01 00:46:21'),
 (8,'PIZZA BANANA','Massa, creme de leite, mussarela, banana c/ açúcar, canela e leite condensado.',4,'30.00','',1,'2016-09-18 08:18:09','2016-11-01 00:44:56','pizza-banana.jpg','image/jpeg',192933,'2016-11-01 00:44:52'),
 (9,'PIZZA ATUM','Massa, molho, mussarela, orégano, azeitona, atum, tomate e cebola.',4,'20.00','',1,'2016-09-20 22:16:19','2016-11-01 00:43:33','pizza_atum.jpg','image/jpeg',88959,'2016-11-01 00:43:29'),
 (10,'PIZZA SABORES','Massa fina, mussarela, presunto, ervilha, milho, bacon, frango, catupiry, cebola e azeitonas.',4,'35.50','',1,'2016-09-30 01:47:44','2016-11-01 00:48:51','4queijos.jpg','image/jpeg',100969,'2016-09-30 01:47:41'),
 (11,'PIZZA FRANGO C/ CATUPIRY','Massa fina, molho, calabresa fatiada, cebolas salpicado c/ provolone, orégano e azeitonas. O melhor.',3,'40.00','',1,'2016-10-11 22:19:28','2016-11-01 00:47:58','pizza_frango_com_catupiry.png','image/png',675163,'2016-10-11 22:19:26'),
 (12,'PIZZA ALHO','Massa, molho, mussarela, orégano, alho, tomate e cebola.',3,'45.00','',1,'2016-10-23 17:58:03','2016-11-01 00:42:11','pizza-alho.jpg','image/jpeg',93300,'2016-11-01 00:41:56');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;


--
-- Definition of table `registros`
--

DROP TABLE IF EXISTS `registros`;
CREATE TABLE `registros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8_unicode_ci,
  `observacao` text COLLATE utf8_unicode_ci,
  `concluido` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `registros`
--

/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` (`id`,`referencia`,`descricao`,`observacao`,`concluido`,`created_at`,`updated_at`) VALUES 
 (1,'config/initializers/rails_admin.rb','# Adicionar um título (label) para o model Produto, que consequentimente é o pai dos\r\n  # models Tipo e Mesa\r\n  config.model \'Mesa\' do\r\n    navigation_label \'Estabelecimento\'\r\n  end\r\n  config.model \'Produto\' do\r\n    navigation_label \'Cardápio Online\'\r\n  end\r\n  config.model \'Registro\' do\r\n    navigation_label \'DESENVOLVIMENTO\'\r\n  end\r\n\r\n  # Para excluir os models do painel administrativo\r\n  # config.excluded_models = [\"Tipo\",\"Mesa\"]\r\n\r\n  # Para incluir os models no painel administrativo\r\n  # config.included_models = [\"Tipo\",\"Mesa\"]\r\n\r\n  # Definir parent entre os models\r\n  # Os model Tipo é considerado filho do pai Produto\r\n  # Excemplo:\r\n  # Produto\r\n  # -> Tipo\r\n\r\n  config.model \'Tipo\' do\r\n    parent Produto\r\n  end\r\n\r\n  # Define o título (label) para os links static\r\n  config.navigation_static_label = \"Acesso rápido\"\r\n  config.navigation_static_links = {\r\n    \'Página principal\' => \'http://localhost:3000\',\r\n    \'Mesas\' => \'http://localhost:3000/mesas\',\r\n    \'Produtos\' => \'http://localhost:3000/produtos\',\r\n    \'Tipos\' => \'http://localhost:3000/tipos\'\r\n  }\r\n\r\n# https://github.com/sferik/rails_admin/wiki\r\n# https://github.com/sferik/rails_admin/wiki/Navigation','Configurações como, título do grupo de models.',1,'2016-09-28 19:57:38','2016-09-28 20:24:33'),
 (2,'db/migrate/20160928192439_create_registros.rb','class CreateRegistros < ActiveRecord::Migration\r\n  def change\r\n    create_table :registros do |t|\r\n      t.string :referencia\r\n      t.text :descricao\r\n      t.text :observacao\r\n      t.boolean :concluido\r\n\r\n      t.timestamps null: false\r\n    end\r\n  end\r\nend\r\n','Para poder registrar as alterações que forem feitas durante o desenvolvimento. Para excluir do admin_rails basta apenas adicionar o comando à página rails_admin.rb config.excluded_models = [\"Registro\"]',1,'2016-09-28 20:00:32','2016-09-28 20:00:32'),
 (3,'Gemfile / gem \'will_paginate\'','1) gem \'will_paginate\', \'~> 3.1\'\r\n2) bundle install\r\n3) No controller produtos troca o comando \"@produtos = Produto.all\" por :\r\n\"@produtos = Produto.where(:publicado => true).paginate(:page => params[:page], :per_page => 3).order(\'updated_at DESC\')\"\r\n\r\nDocumentação: https://github.com/mislav/will_paginate\r\n\r\n4) Adicionar o comando \"<%= will_paginate @produtos%>\" na página index da view produtos.\r\n\r\n# PARA USAR AS FORMATAÇÕES DO BOOTSTRAP BASTA APENAS:\r\n1) gem \'will_paginate-bootstrap\'\r\n2) bundle install\r\n3) Na view index de produtos trocar o comando \"<%= will_paginate @produtos%>\" por:\r\n\"<%= will_paginate @produtos, renderer: BootstrapPagination::Rails %>\"\r\n\r\nDocumentação: https://github.com/bootstrap-ruby/will_paginate-bootstrap\r\n','O Rails_admin acusou o seguinte erro:\r\nundefined method `per\' for #<Produto::ActiveRecord_Relation:0x0000000cec26e0>\r\n\r\nConflito ao utilizar o will_pagination. Para solucionar este problema foi necessário apenas adicionar um novo arquivo cujo caminho e o nome será \"config/initializers/kaminari.rb\", dentro deste arquivo adicione o seguinte bloco de comandos para definirmos um novo caminho:\r\n\r\nKaminari.configure do |config|\r\n  config.page_method_name = :per_page_kaminari\r\nend\r\n\r\nReferência 1: https://github.com/sferik/rails_admin/issues/1420\r\nReferência 2: https://github.com/sferik/rails_admin/wiki/Troubleshoot',1,'2016-09-30 01:40:06','2016-09-30 01:40:06'),
 (4,'Pesquisar / Buscar produto','Foi necessário criar um método dentro do model produtos:\r\n\r\ndef self.search(search, page)\r\n    order(\'id\')\r\n    .where(:publicado => true)\r\n    .where(\'id LIKE ? or nome LIKE ? or descricao LIKE ?\', \"%#{search}%\", \"%#{search}%\", \"%#{search}%\")\r\n    .paginate(page: page, per_page: 3)\r\n    .order(\'created_at DESC\')\r\n  end\r\n\r\nDepois, no controller \"ProdutosController\" foi necessário trocar o comando:\r\n\"@produtos = Produto.where(:publicado => true).paginate(:page => params[:page], :per_page => 3).order(\'updated_at DESC\')\"\r\n\r\npor:\r\n\r\n\"@produtos = Produto.search(params[:search], params[:page])\".\r\n\r\nPor último, foi necessário criar a ação para o formulário de busca localizado em \"app/views/layouts/application.html.erb\". Deixando o formulário como o exemplo abaixo:\r\n\r\n<form class=\"navbar-form navbar-left\">\r\n   <div class=\"form-group\">\r\n      <%= form_tag({}, {:method => :get}) do %>\r\n      <%= text_field_tag :search, params[:search], :class=> \"form-control\", :placeholder=> \"Digite aqui\" %>\r\n   </div>\r\n      <%= submit_tag(\"Buscar\", :id=>\"button\", :class=>\"btn btn-default\", :name=>\"submit\") %>\r\n   <% end %>\r\n</form>','O comando \".where(:publicado => true)\" é para trazer apenas produtos que estejam marcados como publicado pelo administrador.',1,'2016-09-30 04:42:56','2016-09-30 04:42:56'),
 (5,'Breadcrumb para rails','Para adicionar o breadcrumb é necessário instalar a gem:\r\n\r\n1) gem \"breadcrumbs_on_rails\"\r\n2) bundle install\r\n3) Adicionar no \"app/controllers/application_controller.rb\":\r\n\r\nadd_breadcrumb \"Página principal\", :root_path, :options => { :title => \"Página principal\" },\r\npara definir o caminho para a página principal em todas as páginas.\r\n\r\n4) Adicionar no index de cada controller (ProdutosController) o comando:\r\n\r\nadd_breadcrumb \"Produto\", produtos_path, :title => \"Voltar para a Página principal\"\r\n\r\n5) Adicionar no Body da página \"app/views/layouts/application.html.erb\" o comando:\r\n\r\n<ol class=\"breadcrumb\">\r\n  <%= render_breadcrumbs :tag => :li, :separator => \"\" %>\r\n</ol>\r\n\r\nDocumentação: https://github.com/weppos/breadcrumbs_on_rails','Como não preparei ainda minha página principal eu deixei o caminho para produtos_path em \"app/controllers/application_controller.rb\", porém, quando finalizar a página principal não esqueça de alterar o caminho do path.\r\n\r\nPara o breadcrumb aparecer nas páginas show, new e edit foi preciso adicionar os seguintes comandos em cada um deles:\r\n\r\n  # GET /produtos/1\r\n  # GET /produtos/1.json\r\n  def show\r\n    @produtos = Produto.find(params[:id])\r\n    add_breadcrumb \"Produto\", produtos_path, :title => \"Voltar para a Página principal\"\r\n    add_breadcrumb @produtos.nome\r\n  end\r\n\r\n  # GET /produtos/new\r\n  def new\r\n    @produto = Produto.new\r\n    add_breadcrumb \"Produto\", produtos_path, :title => \"Voltar para a Página principal\"\r\n    add_breadcrumb \"Novo\"\r\n  end\r\n\r\n  # GET /produtos/1/edit\r\n  def edit\r\n    @produtos = Produto.find(params[:id])\r\n    add_breadcrumb \"Produto\", produtos_path, :title => \"Voltar para a Página principal\"\r\n    add_breadcrumb \"Editando \" + @produtos.nome\r\n  end\r\n\r\n\r\nE em index continuo os mesmos comandos:\r\nadd_breadcrumb \"Produto\", produtos_path, :title => \"Voltar para a Página principal\"',1,'2016-09-30 06:48:02','2016-09-30 22:32:47'),
 (6,'20161001024825_alter_type_valor_produtos.rb','Criando uma migration e alterando o tipo/configurações de um campo da tabela.\r\n\r\n1) rails g migration AlterTypeValorProdutos\r\n2) Adicione o comando: change_column :produtos, :valor, :decimal, :precision => 15, :scale => 3\r\n3) rake db:migrate\r\n','Não é aconselhável alterar a migration depois de tê-la executado. ',1,'2016-10-01 04:26:50','2016-10-01 04:26:50'),
 (7,'Definindo um valor default: \'0.00\' para um campo na tabela.','Definindo um valor padrão para o campo valor na tabela produtos.\r\n\r\n1) rails g migration AddDefaultValorProdutos\r\n2) Adicionar o comando: change_column :produtos, :valor, :decimal, :precision => 15, :scale => 3, default: \'0.00\'\r\n3) rake db:migrate\r\n\r\nDefinindo um valor padrão para o campo cadeiras na tabela mesas.\r\n\r\n1) rails g migration AddDefaultCadeirasMesas\r\n2) Adicionar o comando: change_column :mesas, :cadeiras, :integer, default: \'1\'\r\n3) rake db:migrate','Consta duas alterações, tabela produtos e mesas.',1,'2016-10-01 04:31:52','2016-10-01 04:41:15'),
 (8,'validates model Mesa','validates :codigo, :presence => true, \r\nexclusion: { in: %w(Mesa MESA mesa mesa1 mesa01 mesa0001),\r\nmessage: \"%{value} não é permitido por questões de segurança. \r\nSugerimos que escolha um código que não seja fácil para o usuário descobrir. Por exemplo, DIADOSPAIS150.\r\nPorém, fica a seu critério qual código usar considerando que seja seguro.\" }, \r\nuniqueness: { case_sensitive: false },\r\nlength: { minimum: 8, maximum: 20}\r\n\r\n\r\nDocumentação 1: http://guides.rubyonrails.org/active_record_validations.html\r\nDocumentação 2: http://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html','Irá encontrar mais validações para o model na documentação do próprio Ruby On Rails, links na descrição.',1,'2016-10-01 04:48:51','2016-10-01 04:48:51'),
 (9,'Video na página principal','1) Adicionar a estrutura na página principal:\r\n(app/views/pages/index.html.erb)\r\n\r\n<video poster=\"\" id=\"bgvid\" playsinline autoplay muted loop>\r\n<!-- <source src=\"http://thenewcode.com/assets/videos/polina.webm\" type=\"video/webm\"> -->\r\n<!-- <source src=\"http://thenewcode.com/assets/videos/polina.mp4\" type=\"video/mp4\"> -->\r\n<source src=\"videos/teste.mp4\" type=\"video/mp4\">\r\n</video>\r\n<div class=\"container\">\r\n<!-- Conteúdo aqui -->\r\n</div>\r\n\r\n2) Adicionar o estilo no arquivo (.SCSS):\r\n(app/assets/stylesheets/pages.scss)\r\n\r\nvideo { \r\n    position: fixed;\r\n    top: 50%;\r\n    left: 50%;\r\n    min-width: 100%;\r\n    min-height: 100%;\r\n    width: auto;\r\n    height: auto;\r\n    z-index: -100;\r\n    transform: translateX(-50%) translateY(-50%);\r\n background: url(\'\') no-repeat;\r\n  background-size: cover;\r\n  transition: 1s opacity;\r\n}','Alguns vídeos não funcionaram, mesmo sendo .mp4.',1,'2016-10-04 02:24:45','2016-10-04 02:24:45'),
 (10,'Adicionando Login na página principal','1) Adicionar os códigos abaixo na página principal:\r\n(app/views/pages/index.html.erb)\r\n\r\n<div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-md-4 col-md-offset-7\">\r\n                <div class=\"panel panel-default\">\r\n                    <div class=\"panel-heading\">\r\n                        <span class=\"glyphicon glyphicon-lock\"></span> Login</div>\r\n                        <div class=\"panel-body\">\r\n                            <form class=\"form-horizontal\" role=\"form\">\r\n                                <div class=\"form-group\">\r\n                                    <label for=\"inputEmail3\" class=\"col-sm-3 control-label\">\r\n                                        Email</label>\r\n                                        <div class=\"col-sm-9\">\r\n                                            <input type=\"email\" class=\"form-control\" id=\"inputEmail3\" placeholder=\"Email\" required>\r\n                                        </div>\r\n                                    </div>\r\n                                    <div class=\"form-group\">\r\n                                        <label for=\"inputPassword3\" class=\"col-sm-3 control-label\">\r\n                                            Senha</label>\r\n                                            <div class=\"col-sm-9\">\r\n                                                <input type=\"password\" class=\"form-control\" id=\"inputPassword3\" placeholder=\"Senha\" required>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div class=\"form-group\">\r\n                                            <div class=\"col-sm-offset-3 col-sm-9\">\r\n                                                <div class=\"checkbox\">\r\n                                                    <label>\r\n                                                        <input type=\"checkbox\"/>\r\n                                                        Lembrar-me\r\n                                                    </label>\r\n                                                </div>\r\n                                            </div>\r\n                                        </div>\r\n                                        <div class=\"form-group last\">\r\n                                            <div class=\"col-sm-offset-3 col-sm-9\">\r\n                                                <button type=\"submit\" class=\"btn btn-success btn-sm\">\r\n                                                    Entrar</button>\r\n                                                    <button type=\"reset\" class=\"btn btn-default btn-sm\">\r\n                                                        Limpar</button>\r\n                                                    </div>\r\n                                                </div>\r\n                                            </form>\r\n                                        </div>\r\n                                        <div class=\"panel-footer\">\r\n                                            Não possui uma conta? <a href=\"#\">Crie agora</a></div>\r\n                                        </div>\r\n                                    </div>\r\n                                </div>\r\n                            </div>','Ainda falta adicionar a GEM e criar as sessões, esse é só um preview. ',1,'2016-10-04 02:34:11','2016-10-04 02:34:11'),
 (11,'Definir Porta Padrão para rodar o projeto Ruby On Rails','1) Em config/boot.rb, adicione o seguinte bloco de comando:\r\n\r\nrequire \'rails/commands/server\'\r\nmodule Rails\r\n  class Server\r\n    alias :default_options_alias :default_options\r\n    def default_options\r\n      default_options_alias.merge!(:Port => 3000)\r\n    end\r\n  end\r\nend','Onde está (:Port => 3000), você pode definir a porta que for preciso.',1,'2016-10-04 04:38:35','2016-10-04 04:38:35'),
 (12,'Gemfile / gem \"font-awesome-rails\"','1) Adicionar gem \"font-awesome-rails\";\r\n2) Bundle install\r\n\r\n3) Adicionar o comando abaixo:\r\n(app/assets/stylesheets/applications.css.scss)\r\n\r\n/*\r\n *= require font-awesome\r\n */\r\n@import \"font-awesome\";\r\n\r\n4) Necessário apenas iniciar o servidor (rails s).\r\n\r\nDocumentação:\r\nhttps://github.com/bokmann/font-awesome-rails\r\n\r\nhttp://fontawesome.io/examples/\r\nhttp://fontawesome.io/icons/','Para utilizar no index.html.erb necessário apenas adicionar a tag <i class=\" \"></i>, e definir sua classe com o nome do icone desejado, por exemplo, <i class=\"fa fa-bell\"></i>.',1,'2016-10-06 01:01:58','2016-10-06 01:01:58'),
 (13,'Erro: Rake aborted!','C:\\Users\\CHARLON\\Dropbox\\UNICA\\TCC\\qro>rake db:migrate\r\nrake aborted!\r\nGem::LoadError: You have already activated rake 11.3.0, but your Gemfile require\r\ns rake 11.2.2. Prepending `bundle exec` to your command may solve this.\r\nC:/Users/CHARLON/Dropbox/UNICA/TCC/qro/config/boot.rb:3:in `<top (required)>\'\r\nC:/Users/CHARLON/Dropbox/UNICA/TCC/qro/config/application.rb:1:in `<top (required)>\'\r\nC:/Users/CHARLON/Dropbox/UNICA/TCC/qro/Rakefile:4:in `<top (required)>\'\r\nLoadError: cannot load such file -- bundler/setup\r\nC:/Users/CHARLON/Dropbox/UNICA/TCC/qro/config/boot.rb:3:in `<top (required)>\'\r\nC:/Users/CHARLON/Dropbox/UNICA/TCC/qro/config/application.rb:1:in `<top (required)>\'\r\nC:/Users/CHARLON/Dropbox/UNICA/TCC/qro/Rakefile:4:in `<top (required)>\'\r\n(See full trace by running task with --trace)','Foi necessário apenas excluir o arquivo \"Gemfile.lock\", logo em seguida executar o \"rake db:migrate\"',1,'2016-10-06 01:05:33','2016-10-06 01:05:33'),
 (14,'Formatar :decimal  (R$ 00,00)','Para apresentar os valores com esta formatação na view é necessário criar um método no helper. Segue abaixo o método:\r\n\r\n1) Adicionar no helper, no meu caso, por exemplo, ProdutosHelper:\r\n\r\ndef valor_decimal(x)\r\n    	x = number_to_currency(x, unit: \"R$\", separator: \",\", delimiter: \"\")\r\nend\r\n\r\n2) Adicionar na view, no meu caso, por exemplo, (app/views/produtos/index.html.erb):\r\n\r\n<%= valor_decimal(produto.valor) %>\r\n\r\nDocumentação:\r\nhttp://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html#method-i-number_to_currency\r\n','É só acessar a documentação para verificar outras formatações.',1,'2016-10-06 03:24:40','2016-10-06 03:24:40'),
 (15,'Error: Server certificate B: certificate verify failed - certificado','Descrição completa do erro:\r\nGem::RemoteFetcher::FetchError: SSL_connect returned=1 errno=0 state=SSLv3 read\r\nserver certificate B: certificate verify failed\r\n(https://rubygems.org/gems/rake-11.3.0.gem)\r\nAn error occurred while installing rake (11.3.0), and Bundler cannot continue.\r\nMake sure that `gem install rake -v \'11.3.0\'` succeeds before bundling.\r\n\r\nIsso é devido a atualização realizada pela RubyGems que visa melhorar na comunicação entre seus servidores na hora de baixar as gems, visando principalmente a segurança. Para isso, deixaram a documentação disponível para que possamos realizar todas as correções possíveis. \r\n\r\nInfelizmente, demorei achar a solução devido estar aprendendo sozinho, testei várias possibilidades, até mesmo disponibilizado pela própria empresa Ruby, mas só depois de dois dias batalhando, além de ter que reinstalar o windows (por ter corrompido com alguma coisa, é coisa de windows, certo!). \r\n\r\n1) Visite o endereço: https://rubygems.org/pages/download#formats\r\n2) Fazer o download ZIP.\r\n3) Extrair o conteúdo. Dentro da pasta rubygems-x.y.z execute o comando Ruby setup.rb.\r\n4) Pronto! Como realizei uma nova instalação foi preciso apenas testar o Devkit e instalar o json e bundler.\r\n5) Já que possuo o projeto e dentro o arquivo GEMFILE que possui a relação de todas dependências do projeto. Então, necessário apenas acessar o projeto pelo prompt e executar o comando \"bundler install\".','Documentação Devkit: https://github.com/oneclick/rubyinstaller/wiki/Development-Kit',1,'2016-10-11 21:50:15','2016-10-13 01:24:20'),
 (16,'Gemfile / gem \'devise\'','1) gem \'devise\'\r\n2) bundle install\r\n3) rails g devise:install\r\n4) Acessar o arquivo \"config/environments/development.rb\" e definir a porta padrão: config.action_mailer.default_url_options = { host: \'localhost\', port: 3000 }\r\n\r\n5) Acessar o arquivo \"app/views/layouts/application.html.erb\" e adicionar o conteúdo abaixo antes de <%= yield %>:\r\n<% if notice %>\r\n  <p class=\"alert alert-success\"><%= notice %></p>\r\n<% end %>\r\n<% if alert %>\r\n  <p class=\"alert alert-danger\"><%= alert %></p>\r\n<% end %>\r\n\r\n6) Acessar o arquivo \"app/views/ideas/show.html.erb\" e remover a linha \"<p id=\"notice\"><%= notice %></p>\".\r\nFazer o mesmo para os demais arquivos.\r\n\r\n7) Gerar o model User: rails g devise user\r\n8) rake db:migrate\r\n\r\n9) Basta acessar o caminho \"http://localhost:3000/users/sign_up\" e realizar o teste criando um usuário.\r\n10) Para adicionar notificações basta abrir o arquivo \"app/views/layouts/application.html.erb\" e adicionar o conteúdo abaixo lodo depois da barra de menus <ul class=\"nav\">:\r\n\r\n<p class=\"navbar-text pull-right\">\r\n<% if user_signed_in? %>\r\n  Logged in as <strong><%= current_user.email %></strong>.\r\n  <%= link_to \'Edit profile\', edit_user_registration_path, :class => \'navbar-link\' %> |\r\n  <%= link_to \"Logout\", destroy_user_session_path, method: :delete, :class => \'navbar-link\'  %>\r\n<% else %>\r\n  <%= link_to \"Sign up\", new_user_registration_path, :class => \'navbar-link\'  %> |\r\n  <%= link_to \"Login\", new_user_session_path, :class => \'navbar-link\'  %>\r\n<% end %>\r\n\r\n11) Acessar o arquivo \"app/controllers/application_controller.rb\" e adicionar o código abaixo, não esquecer que deve ser logo após o comando \"protect_from_forgery with: :exception\":\r\n\r\nbefore_action :authenticate_user!','Documentação: \r\nhttps://github.com/plataformatec/devise\r\nhttp://guides.railsgirls.com/devise',1,'2016-10-24 23:42:03','2016-12-31 20:09:10');
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;


--
-- Definition of table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`) VALUES 
 ('20160911032018'),
 ('20160911060828'),
 ('20160911061514'),
 ('20160912020816'),
 ('20160912021402'),
 ('20160928192439'),
 ('20161001024825'),
 ('20161001025522'),
 ('20161001030137'),
 ('20161006020827'),
 ('20161006021529'),
 ('20161024222649'),
 ('20161025181811'),
 ('20161025192427'),
 ('20161026001059'),
 ('20161028201638'),
 ('20161028213719'),
 ('20161029070626'),
 ('20161103130544'),
 ('20161103174251'),
 ('20161103174720'),
 ('20161103175625'),
 ('20161110000621');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;


--
-- Definition of table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
CREATE TABLE `tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tipos`
--

/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` (`id`,`nome`,`created_at`,`updated_at`) VALUES 
 (1,'Prato feito','2016-09-11 06:26:38','2016-09-11 06:26:38'),
 (2,'G','2016-09-11 06:27:05','2016-09-11 06:27:05'),
 (3,'M','2016-09-11 06:27:12','2016-09-11 06:27:12'),
 (4,'P','2016-09-11 06:27:18','2016-09-11 06:27:18'),
 (5,'Sobremesa','2016-09-11 14:34:04','2016-09-11 14:34:04');
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `mesa_codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MesaId` int(11) DEFAULT NULL,
  `num_acompanhante` int(11) DEFAULT NULL,
  `cpf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cep` int(11) DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logradouro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_fixo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_celular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`email`,`encrypted_password`,`reset_password_token`,`reset_password_sent_at`,`remember_created_at`,`sign_in_count`,`current_sign_in_at`,`last_sign_in_at`,`current_sign_in_ip`,`last_sign_in_ip`,`created_at`,`updated_at`,`mesa_codigo`,`MesaId`,`num_acompanhante`,`cpf`,`nome`,`cep`,`cidade`,`logradouro`,`bairro`,`numero`,`complemento`,`tel_fixo`,`tel_celular`,`checkin`) VALUES 
 (1,'teste@teste.com','$2a$11$T0s9MZPqq858zPCIAVQXzuZtRYXFwD/MM4D1bRBco/dWK6Iy6ng8W',NULL,NULL,NULL,59,'2017-01-02 21:49:00','2017-01-02 21:45:00','::1','::1','2016-10-24 23:23:04','2017-01-02 21:51:24','MESA0002',2,NULL,'9998887766','Marquescharlon Santos',35160000,'Ipatinga','Rua X','Horto',0,'','(31)9999-9999','(31)98888-8888',1),
 (2,'teste2@teste.com','$2a$11$HlUNW1aPR299eJcrX9yOOeaGUIakrlSCh0hqDZ6Wmi.ZW5j/oB4CS',NULL,NULL,NULL,1,'2016-10-28 19:47:00','2016-10-28 19:47:00','::1','::1','2016-10-28 19:47:02','2016-12-31 19:32:58','',NULL,NULL,'','',NULL,'','','',NULL,'','','',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
