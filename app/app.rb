require 'sinatra/base'

class Database < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :port, 4000
  use Rack::MethodOverride

  get '/' do
    'Hello Database!'
  end

  get '/set' do
    @passed_param = env['rack.request.query_string'].split("=")
    erb :set
  end

  get '/get' do
    'set'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
