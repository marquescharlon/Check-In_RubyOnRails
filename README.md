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

### Caso queira restaurar o backup

- Clique [aqui](https://github.com/marquescharlon/Check-In_RubyOnRails/blob/master/public/apps/qro_backup%2020170107%202254.rar) para baixar o backup do banco de dados que foi construído ao longo do desenvolvimento, nele constará a base de conhecimento. Faça o download deste arquivo e descompacta-o.
- Clique [aqui](https://raw.githubusercontent.com/marquescharlon/check-in_ruby_tcc/master/public/apps/mysql-gui-tools-5.0-r16-win32.msi) para baixar o MySQL GUI Tools, a partir dele você restaurará o backup.

> Você encontrará mais informações para acesso ao banco em ```config/database.yml``` no projeto. 

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
3. Executar o comando: ```ruby -rubygems -e "require 'json'; puts JSON.load('[42]').inspect"``` para confirmar que o Json está funcionando.

# 3. Instalação do Rails e Bundle

- Abrir o Prompt(Modo Administrador) e acessar o diretório do Ruby ```(C:/Ruby22-x64)```;
- Executar o comando: ```gem install rails``` e aguarde, demora um pouco mesmo;
- Depois, execute o comando ```bundle install```;

# 4. Executar o sistema

### Ambiente de Desenvolvimento

1. Abrir o Prompt(Modo Administrador) e acessar o diretório do projeto;
2. Executar o comando: ```rails s``` e aguardar até o servidor ser iniciado por completo;
3. Abra o navegador e acesse o endereço [http://localhost:3000/](http://localhost:3000/);
4. Pronto! O sistema ```Qro Check-in de Mesa``` será carregado.

> Por padrão, o sistema é executado no ambiente de desenvolvimento.

### Ambiente de Teste

1. Abrir o Prompt(Modo Administrador) e acessar o diretório do projeto;
2. Executar o comando ```bundle exec rake db:migrate RAILS_ENV=test```;
3. Ao invés de digitar ```rails s```, digite: ```rails s -e test```.

> Caso não tenha em seu banco de dados o database ```qro_test```, então, execute o seguinte comando: ```bundle exec rake db:create db:migrate RAILS=test```.

### Ambiente de Produção/Cliente

1. Abrir o Prompt(Modo Administrador) e acessar o diretório do projeto;
2. Executar o comando ```bundle exec rake db:migrate RAILS_ENV=production```;
3. Ao invés de digitar ```rails s```, digite: ```rails s -e production```.

> Caso não tenha em seu banco de dados o database ```qro_production```, então, execute o seguinte comando: ```bundle exec rake db:create db:migrate RAILS=production```.

# Conclusão

<p align="justify">Conclui-se que, este projeto atende uma das necessidades encontradas em um estabelecimento, que é a reserva de uma mesa. Em alguns casos submetendo o cliente a uma fila absurda e obrigando-o a esperar sem nenhum conforto até que alguma mesa esteja desocupada. Para o desenvolvimento deste sistema foi necessário enfrentar diversos desafios, entre eles está a própria linguagem de programação utilizada (Ruby), ainda sendo nova no mercado e pouca discutida em ambientes acadêmicos. Outros métodos que estão adquirindo espaço no mercado aos poucos são os métodos ágeis, utilizados neste trabalho para proporcionar o desenvolvimento em um tempo hábil. O sistema apresentado neste trabalho oferece a possibilidade de realizar a reserva da mesa online. Há a necessidade apenas de realizar o check-in na entrada do estabelecimento, pois, um pré-cadastro já foi realizado pelo próprio cliente. Assim como é feita a reserva de uma passagem aérea, tal qual, é realizada online e tendo em vista seu check-in antes do embarque, também será a reserva e o check-in da mesa. Isso proporciona não só conforto, mas a segurança de que ao chegar no estabelecimento será atendido sem a necessidade de enfrentar filas, pois, o seu cadastro já foi feito e a mesa já está reservada.<p>
