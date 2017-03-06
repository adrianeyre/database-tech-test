require 'sinatra/base'
require 'sinatra/json'
require 'json'
require_relative 'models/database'

class Database < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :port, 4000

  get '/view' do
    @passed_param = session["stored_hash"].data
    erb :view
  end

  get '/reset' do
    session["stored_hash"] = VariableDatabase.new
    'Data Reset!'
  end

  get '/set' do
    @passed_param = env['rack.request.query_hash']
    session["stored_hash"].add(@passed_param.keys[0], @passed_param.values[0])
    erb :view
  end

  get '/get' do
    content_type :json
    session["stored_hash"].get(params["key"]).to_json
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
