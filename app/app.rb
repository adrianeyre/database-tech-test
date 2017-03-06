require 'sinatra/base'
require 'sinatra/json'
require 'json'

class Database < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :port, 4000

  get '/set' do
    session["stored_hash"] ||= []
    @passed_param = env['rack.request.query_hash']
    p session["stored_hash"] << @passed_param
    erb :set
  end

  get '/get' do
    session["stored_hash"] ||= []
    content_type :json
    @sending_param = return_hash(params["key"]).to_json
    erb :get
  end

  def return_hash(key)
    session["stored_hash"].each do |hash|
      return hash if hash[key] != nil
    end
    return {}
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
