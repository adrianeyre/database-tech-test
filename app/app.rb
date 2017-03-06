require 'sinatra/base'

class Database < Sinatra::Base
  get '/' do
    'Hello Database!'
  end

  get '/set' do
    'set'
  end

  get '/get' do
    'set'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
