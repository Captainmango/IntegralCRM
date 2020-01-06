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
    
    @client = Client.create(
      :name => params[:name],
      :contact_number => params[:contact_number],
      :address1 => params[:address1],
      :address2 => params[:address2],
      :city => params[:city],
      :postcode => params[:postcode],
      :email => params[:email],
      :add_info => params[:add_info])
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

  # PATCH: /clients/5
  post "/clients/:id" do
    binding.pry
    @client = Client.find_by_id(params[:id])
    @client.name = params[:name]
    @client.contact_number = params[:contact_number]
    @client.email = params[:email]
    @client.address1 = params[:address1]
    @client.address2 = params[:address2]
    @client.postcode = params[:postcode]
    @client.city = params[:city]
    @client.add_info = params[:add_info]
    @client.save
    redirect "/clients/index"
  end

  # DELETE: /clients/5/delete
  post "/clients/:id/delete" do
    @client = Client.find_by_id(params[:id])
    @client.destroy
    redirect "/clients/index"
  end
end
