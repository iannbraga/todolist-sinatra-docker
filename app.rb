require 'sinatra'
require_relative 'models/task'

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
