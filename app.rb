require 'bundler'
Bundler.require
require "sinatra/reloader" if development?

class CelebrateBoston < Sinatra::Base
  # register Sinatra::Partial
  # enable :partial_underscores

  set :haml, { :ugly => production?, :format => :html5 }
  set :public_folder, File.dirname(__FILE__) + '/static'
  set :pages, %w[qa mission contact]

  configure :production do
    require 'newrelic_rpm'
    NewRelic::Agent.manual_start
  end

  get '/' do
    haml :index
  end

  pages.each do |page|
    get "/#{page}/?" do
      haml page.to_sym
    end
  end
end
