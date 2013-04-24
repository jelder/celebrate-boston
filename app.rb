require 'sinatra'
require "sinatra/reloader" if development?
require 'haml'

set :public_folder, File.dirname(__FILE__) + '/static'

configure :production do
  require 'newrelic_rpm'
  NewRelic::Agent.manual_start
end

get '/' do
  haml(:index, { :ugly => true, :format => :html5 })
end
