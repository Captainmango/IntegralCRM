class CasesController < ApplicationController

  
  get "/cases" do
    @cases = Case.all
    erb :"/cases/index", :layout => :"/layouts/landing"
  end

  get "/my-cases" do
    @user = Helpers.current_user(session)
    @cases = Case.all.where("owner = '#{@user.id}'")
    erb :"/cases/index", :layout => :"/layouts/landing"
  end

  # CREATE
  get "/clients/:id/cases/new" do
    @client = Client.find_by_id(params[:id])
    @users = User.all
    erb :"/cases/new", :layout => :"/layouts/landing"
  end

  post "/clients/:id/cases" do
    @client = Client.find_by_id(params[:id])
    @case = @client.cases.create(params[:kase])
    if @case.save
      flash[:green] = {:title => "Success", :text => "Successfully created case"}
      redirect "/cases/#{@case.id}"
    else
      flash[:red] = {:title => "Failure", :text => "Failed to create case"}
      redirect "/dashboard"
    end
  end

  # READ
  get "/cases/:id" do
    @case = Case.find_by_id(params[:id])
    @user = User.find(@case.owner)
    @client = @case.client
    @notes_ordered = @case.notes.order("created_at DESC")
    erb :"/cases/show", :layout => :"/layouts/landing"
  end

  # UPDATE
  get "/cases/:id/edit" do
    @case = Case.find_by_id(params[:id])
    @users = User.all
    @current_user = Helpers.current_user(session)
    erb :"/cases/edit", :layout => :"/layouts/landing"
  end

  post "/cases/:id" do
    @case = Case.find_by_id(params[:id])
    @case.update(params[:kase])
    if @case.save
      flash[:green] = {:title => "Success", :text => "Successfully updated case"}
      redirect "/cases/#{@case.id}"
    else
      flash[:red] = {:title => "Failure", :text => "Cannot update case"}
      redirect "/cases/#{@case.id}"
    end

  end

  # DELETE
  post "/cases/:id/delete" do
    
    @case = Case.find_by_id(params[:id])
    if Helpers.current_user(session) == @case.owner
      @case.destroy
      flash[:green] = {:title => "Success", :text => "Successfully deleted case"}
      redirect "/cases"
    else
      flash[:red] = {:title => "Failure", :text => "Cannot delete another users' case"}
      redirect "/cases"
    end

  end
end
