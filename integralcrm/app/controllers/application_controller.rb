require './config/environment'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "test_secret"
  end

  get "/" do
    erb :welcome, :layout => :"/layouts/layout"
  end

  get "/dashboard" do
    @clients = Client.all
    @cases = Case.all
    @tasks = Task.all
    erb :dashboard, :layout => :"/layouts/landing"
  end

end
