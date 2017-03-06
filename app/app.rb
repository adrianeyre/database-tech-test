require 'sinatra/base'
require 'sinatra/json'
require 'json'

class Database < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :port, 4000
  use Rack::MethodOverride

  get '/' do
    'Hello Database!'
  end

  get '/set' do
    @passed_param = env['rack.request.query_hash']
    erb :set
  end

  get '/get' do
    headers 'Access-Control-Allow-Origin' => '*'
    content_type :json
    {"somekey"=>"somevalue"}.to_json
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
