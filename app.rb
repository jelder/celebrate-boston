require 'sinatra'
require "sinatra/reloader" if development?
require 'haml'

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  haml :index
end
