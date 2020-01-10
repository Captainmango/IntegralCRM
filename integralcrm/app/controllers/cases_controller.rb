class CasesController < ApplicationController

  # GET: /cases
  get "/cases" do
    @cases = Case.all
    erb :"/cases/index", :layout => :"/layouts/landing"
  end

  get "/my-cases" do
    @cases = Case.all.where("owner = '#{session[:used_id]}'")
    erb :"/cases/index", :layout => :"/layouts/landing"
  end

  # GET: /cases/new
  get "/clients/:id/cases/new" do
    @client = Client.find_by_id(params[:id])
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
    @client = @case.client
    @notes_ordered = @case.notes.order("created_at DESC")
    erb :"/cases/show", :layout => :"/layouts/landing"
  end

  # GET: /cases/5/edit
  get "/cases/:id/edit" do
    @case = Case.find_by_id(params[:id])
    erb :"/cases/edit", :layout => :"/layouts/landing"
  end

  # PATCH: /cases/5
  patch "/cases/:id" do
    @case = Case.find_by_id(params[:id])
    @case.update(params[:case])
    @case.save
    redirect "/cases/:id"
  end

  # DELETE: /cases/5/delete
  delete "/cases/:id/delete" do
    @case = Case.find_by_id(params[:id])
    @case.destroy
    redirect "/cases"
  end
end
