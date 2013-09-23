require 'sinatra/base'

class bookmarkmanager < Sinatra::Base
  get '/' do
    'Hello bookmarkmanager!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
