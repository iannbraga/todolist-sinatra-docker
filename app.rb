require 'sinatra'
require 'sinatra/cors'
require_relative 'models/task'

# Configurar o Sinatra para permitir CORS
configure do
  set :allow_origin, '*'
  set :allow_methods, ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS']
  set :allow_headers, ['Content-Type', 'Authorization', 'X-Requested-With']
end

set :bind, "0.0.0.0"
set :public_folder, File.join(File.dirname(__FILE__), 'assets')

get '/' do
  @tasks = Task.all
  erb :index
end

post '/tasks' do
  Task.create(name: params[:name], description: params[:description], done: false)
  redirect '/'
end

post '/tasks/:id/complete' do
  task = Task.find(params[:id])
  task.update(done: true)
  redirect '/'
end
