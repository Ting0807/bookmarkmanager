require 'sinatra/base'
require 'haml'
require 'data_mapper'
require './lib/link'
require './lib/tag'

class BookmarkManager < Sinatra::Base

  get '/' do
  	@links = Link.all
    haml :index
  end
 
 post '/links' do
  url = params["url"]
  title = params["title"]
  tags = params["tags"].split(" ").map do |tag|
  # this will either find this tag or create
  # it if it doesn't exist already
  Tag.first_or_create(:text => tag)
end
Link.create(:url => url, :title => title, :tags => tags)
  # Link.create(:url => url, :title => title)
  redirect to('/')
end

get '/tags/:text' do
  tag = Tag.first(:text => params[:text])
  @links = tag ? tag.links : []
  haml :index
end


env = ENV["RACK_ENV"] || "development"
# step one: create a conection with the database I have created
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

# step two: do the actual work
 # this needs to be done after datamapper is initialised

# step three: After declaring your models, you should finalise them
DataMapper.finalize

# However, how database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

 # start the server if ruby file executed directly
  run! if app_file == $0
end