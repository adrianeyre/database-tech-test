require 'sinatra/base'
require 'sinatra/json'
require 'json'

class Database < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :port, 4000

  get '/set' do
    @passed_param = env['rack.request.query_hash']
    session["stored_hash"] = @passed_param
    erb :set
  end

  get '/get' do
    @key, value = env['rack.request.query_string'].split("=")
    content_type :json
    @sending_param = session["stored_hash"].to_json unless hash_empty?(@key)
    @sending_param = {}.to_json if hash_empty?(@key)
    erb :get
  end

  def hash_empty?(key)
    session["stored_hash"] ||= {}
    session["stored_hash"][key] == nil ? true : false
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
