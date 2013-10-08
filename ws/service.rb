require './ar_base'
require 'sinatra/base'


class App < Sinatra::Base
  set :allow_origin, :any
  set :allow_methods, [:get, :post, :options]

  def set_default_headers(response)
    response.headers["Allow"] = "HEAD,GET,PUT,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Origin"] = 'http://localhost'
    response.headers["Access-Control-Allow-Headers"] = 'X-Requested-With'
  end

  # Angular asks for OPTIONS on routes
  options "*" do
    set_default_headers(response)
  end

  get '/comments/all' do
    set_default_headers(response)
    content_type :json
    Comment.all.to_json
    #{}"[ { \"username\":\"Test\", \"comment\":\"asdf\" } ]"
  end
end  
