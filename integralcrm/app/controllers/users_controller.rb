class UsersController < ApplicationController

  # sign up to site
  get "/users/signup" do
    erb :"/users/signup", :layout => :"/layouts/layout"
  end

  post "/users/signup" do
    @user = User.new(:username => params[:username], :password => params[:password])
    if !User.find_by(username: @user.username) && @user.save
      redirect "/users/login"
    else
      "unsuccessful sign up attempt"
    end
  end

  # login to site
  post "/users/login" do
    @user = User.find_by!(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/dashboard", :layout => :"/layouts/landing"
    else
      "unsuccessful log in attempt"
    end
    redirect "/users"
  end

  get "/users/login" do
    erb :"/users/login", :layout => :"/layouts/layout"
  end

  # change details render
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # change details submission
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # remove account
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get "/users/logout" do
    session.clear
    redirect "/users/login"
  end

end
