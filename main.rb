require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require './address'

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

configure :production do
  DataMapper.setup(:default, ENV['DTABASE_URL'])
end

get '/' do
  slim :home
end

get '/addresses' do
  @addresses = Adress.all
  slim :index
end

get '/addresses/new' do
  @address = Address.new
  slim :new
end

post '/addresses' do
  create_address
  redirect_to("/addresses")
end

get '/addresses/:id/edit' do
  @address = Address.get(params[:id])
  slim :edit
end

put '/addresses/:id' do
  address = Address.get(params[:id])
  address.update(params[:address])
  redirect to("/")
end
