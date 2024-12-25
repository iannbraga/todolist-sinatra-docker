# Usando uma imagem base com Ruby
FROM ruby:3.2

# Instalando dependências do sistema (se necessário)
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Criando e configurando o diretório de trabalho
WORKDIR /app

# Copiando o Gemfile e instalando as dependências
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

# Copiando o código da aplicação
COPY . /app

# Expondo a porta que o Sinatra vai usar
EXPOSE 4567

# Definindo o comando para iniciar o servidor Sinatra
CMD ["ruby", "app.rb"]
