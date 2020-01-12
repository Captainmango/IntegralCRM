require './config/environment'
require 'google/apis/calendar_v3'
require 'google/api_client/client_secrets'
require 'json'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "test_secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome, :layout => :"/layouts/layout"
  end

  get "/dashboard" do
    unless session.has_key?(:credentials)
      redirect "/oauth2callback"
    end
    client_opts = JSON.parse(session[:credentials])
    auth_client = Signet::OAuth2::Client.new(client_opts)
    calendar_service = Google::Apis::CalendarV3::CalendarService.new
    calendar_service.authorization = auth_client
    @calendar = calendar_service.get_calendar('primary')
    
    @clients = Client.all
    @cases = Case.all
    @tasks = Task.all

    erb :dashboard, :layout => :"/layouts/landing"
  end

  get '/oauth2callback' do
    client_secrets = Google::APIClient::ClientSecrets.load
    auth_client = client_secrets.to_authorization
    auth_client.update!(
      :scope => 'https://www.googleapis.com/auth/calendar.readonly',
      :redirect_uri => url('/oauth2callback'))
    if request['code'] == nil
      auth_uri = auth_client.authorization_uri.to_s
      redirect to(auth_uri)
    else
      auth_client.code = request['code']
      auth_client.fetch_access_token!
      auth_client.client_secret = nil
      session[:credentials] = auth_client.to_json
      redirect to("/dashboard")
    end
  end
  

end
