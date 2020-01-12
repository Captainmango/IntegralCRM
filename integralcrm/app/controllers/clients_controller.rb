class ClientsController < ApplicationController

  get "/clients/index" do
    @clients = Client.all
    erb :"/clients/index", :layout => :"/layouts/landing"
  end

  # CREATE

  get "/clients/new" do
    erb :"/clients/new", :layout => :"/layouts/landing"
  end

  post "/clients" do
    @client = Client.create(params[:client])
    @client.save
    @client.created_by = session[:user_id]
    redirect "/dashboard"
  end

  # READ

  get "/clients/:id" do
    @client = Client.find_by_id(params[:id])
    @cases = @client.cases.order("created_at DESC").limit(5)
    @notes = Note.where("client_id = '#{@client.id}'").order("created_at DESC").limit(3)
    erb :"/clients/show", :layout => :"/layouts/landing"
  end

  get "/clients/:id/cases" do
    @client = Client.find_by_id(params[:id])
    @cases = @client.cases
    erb :"/cases/index", :layout => :"/layouts/landing"
  end

  get "/clients/:id/notes" do
    @client = Client.find_by_id(params[:id])
    @notes = @client.notes.order("created_at DESC")
    erb :"/notes/index", :layout => :"/layouts/landing"
  end

  # UPDATE

  get "/clients/:id/edit" do
    @client = Client.find_by_id(params[:id])
    erb :"/clients/edit", :layout => :"layouts/landing"
  end

  post "/clients/:id" do
    @client = Client.find_by_id(params[:id])
    @client.update(params[:client])
    if @client.save
      flash[:green] = {:title => "Success", :text => "Successfully updated client"}
      redirect "/clients/#{@client.id}"
    else
      flash[:red] = {:title => "Failure", :text => "Failed to update client"}
    end
    
  end

  # DELETE

  post "/clients/:id/delete" do
    @client = Client.find_by_id(params[:id])
    if @client.created_by == Helpers.current_user(session).id
      @client.destroy
      flash[:green] = {:title => "Success", :text => "Successfully deleted client"}
      redirect "/clients/index"
    else
      flash[:red] = {:title => "Failure", :text => "Cannot delete client you did not create"}
      redirect "/clients/index"
    end
    
  end
end
