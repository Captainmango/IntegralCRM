class CasesController < ApplicationController

  # GET: /cases
  get "/cases" do
    @cases = Case.all
    erb :"/cases/index", :layout => :"/layouts/landing"
  end

  # GET: /cases/new
  get "/cases/new" do
    erb :"/cases/new"
  end

  # POST: /cases
  post "/cases" do
    @case = Case.create(params[:case])
    @case.save
    erb :"/cases/#{@case.id}", :layout => :"/layouts/landing"
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
