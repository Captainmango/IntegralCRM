class ClientsController < ApplicationController

  # GET: /clients
  get "/clients/index" do
    @clients = Client.all
    erb :"/clients/index", :layout => :"/layouts/landing"
  end

  # GET: /clients/new
  get "/clients/new" do
    erb :"/clients/new", :layout => :"/layouts/landing"
  end

  # POST: /clients
  post "/clients" do
    binding.pry
    @client = Client.create(params[:client])
    @client.save
    redirect "/dashboard"
  end

  # GET: /clients/5
  get "/clients/:id" do
    @client = Client.find_by_id(params[:id])
    erb :"/clients/show", :layout => :"/layouts/landing"
  end

  # GET: /clients/5/edit
  get "/clients/:id/edit" do
    @client = Client.find_by_id(params[:id])
    erb :"/clients/edit", :layout => :"layouts/landing"
  end

  get "/clients/:id/cases" do
    @client = Client.find_by_id(params[:id])
    @cases = @client.cases
    erb :"/cases/index", :layout => :"/layouts/landing"
  end

  # PATCH: /clients/5
  post "/clients/:id" do
    
    @client = Client.find_by_id(params[:id])
    @client.update(params[:client])
    @client.save
    redirect "/clients/#{@client.id}"
  end

  # DELETE: /clients/5/delete
  post "/clients/:id/delete" do
    @client = Client.find_by_id(params[:id])
    @client.destroy
    redirect "/clients/index"
  end
end
