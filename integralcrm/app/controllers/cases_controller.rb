class CasesController < ApplicationController

  # GET: /cases
  get "/cases" do
    @cases = Case.all
    erb :"/cases/index", :layout => :"/layouts/landing"
  end

  get "/my-cases" do
    @user = Helpers.current_user(session)
    @cases = Case.all.where("owner = '#{@user.id}'")
    erb :"/cases/index", :layout => :"/layouts/landing"
  end

  # GET: /cases/new
  get "/clients/:id/cases/new" do
    @client = Client.find_by_id(params[:id])
    @users = User.all
    erb :"/cases/new", :layout => :"/layouts/landing"
  end

  # POST: /cases
  post "/clients/:id/cases" do
    @client = Client.find_by_id(params[:id])
    @case = @client.cases.create(params[:kase])
    @case.save
    redirect "/cases/#{@case.id}"
  end

  # GET: /cases/5
  get "/cases/:id" do
    @case = Case.find_by_id(params[:id])
    @user = User.find(@case.owner)
    @client = @case.client
    @notes_ordered = @case.notes.order("created_at DESC")
    erb :"/cases/show", :layout => :"/layouts/landing"
  end

  # GET: /cases/5/edit
  get "/cases/:id/edit" do
    @case = Case.find_by_id(params[:id])
    @users = User.all
    @current_user = Helpers.current_user(session)
    erb :"/cases/edit", :layout => :"/layouts/landing"
  end

  # PATCH: /cases/5
  post "/cases/:id" do
    @case = Case.find_by_id(params[:id])
    @case.update(params[:kase])
    @case.save
    redirect "/cases/#{@case.id}"
  end

  # DELETE: /cases/5/delete
  post "/cases/:id/delete" do
    
    @case = Case.find_by_id(params[:id])
    if Helpers.current_user(session) == @case.owner
      @case.destroy
      redirect "/cases/index"
    else
      flash[:nodel] = "Cannot delete another users' case"
      redirect "/cases/index"
    end

  end
end
