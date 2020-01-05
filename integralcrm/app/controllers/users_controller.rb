class UsersController < ApplicationController

  # sign up to site
  get "/users/signup" do
    erb :"/users/signup"
  end

  post "/users/signup" do
    @user = User.new(:username => params[:username], :password => params[:password])
    if @user.new_record? && @user.save
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
      redirect "/landing"
    else
      "unsuccessful log in attempt"
    end
    redirect "/users"
  end

  get "/users/login" do
    erb :"/users/login"
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
end
