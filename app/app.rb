require 'sinatra/base'
require 'sinatra/json'
require 'json'
require_relative 'models/database'

class Database < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :port, 4000

  Variables = VariableDatabase.new

  get '/view' do
    @passed_param = Variables.data
    erb :view
  end

  get '/reset' do
    Variables = VariableDatabase.new
    'Data Reset!'
  end

  get '/set' do
    @passed_param = env['rack.request.query_hash']
    Variables.add(@passed_param)
    erb :view
  end

  get '/get' do
    content_type :json
    Variables.get(params["key"]).to_json
  end

  run! if app_file == $0
end
