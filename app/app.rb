require 'sinatra/base'
require 'sinatra/json'
require 'json'

class Database < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :port, 4000

  get '/view' do
    @passed_param = session["stored_hash"]
    erb :view
  end

  get '/reset' do
    session["stored_hash"] = {}
    'Data Reset!'
  end

  get '/set' do
    @passed_param = env['rack.request.query_hash']
    session["stored_hash"][@passed_param.keys[0]] = @passed_param.values[0]
    erb :view
  end

  get '/get' do
    content_type :json
    return_hash(params["key"]).to_json
  end

  def return_hash(key)
    return {key=>session["stored_hash"][key]} if key_not_nil?(key)
    {}
  end

  def key_not_nil?(key)
    session["stored_hash"][key] != nil
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
