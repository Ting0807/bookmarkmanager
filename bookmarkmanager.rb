require 'sinatra/base'
require 'haml'
require 'data_mapper'

class BookmarkManager < Sinatra::Base

  get '/' do
    haml :index
  end


env = ENV["RACK_ENV"] || "development"
# step one: create a conection with the database I have created
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

# step two: do the actual work
require './lib/link' # this needs to be done after datamapper is initialised
require './lib/tag'
require './lib/user'
# step three: After declaring your models, you should finalise them
DataMapper.finalize

# However, how database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

 # start the server if ruby file executed directly
  run! if app_file == $0
end