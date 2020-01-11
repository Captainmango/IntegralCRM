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
    @user = Helpers.current_user(session)
    @notes = Note.where("owner ='#{@user.id}'").order("created_at DESC")
    erb :"/users/edit", :layout => :"/layouts/landing"
  end

  # change details submission
  post "/users/:id" do
    redirect "/users/:id"
  end

  # remove account
  post "/users/:id/delete" do
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect "/"
  end

  get "/users/logout" do
    session.clear
    redirect "/users/login"
  end

end
