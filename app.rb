require 'bundler'
Bundler.require

class CelebrateBoston < Sinatra::Base
  require "sinatra/reloader" if development?

  # register Sinatra::Partial
  # enable :partial_underscores

  set :haml, { :ugly => production?, :format => :html5 }
  set :public_folder, File.dirname(__FILE__) + '/static'
  set :pages, %w[qa mission contact]

  configure do
    ::NewRelic::Agent.manual_start
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
