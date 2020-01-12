class NotesController < ApplicationController

 
  get "/notes" do
    @notes = Note.all
    erb :"/notes/index", :layout => :"/layouts/landing"
  end

  # CREATE
  get "/notes/new" do
    erb :"/notes/new", :layout => :"/layouts/landing"
  end

  get "/clients/:id/notes/new" do
    @client = Client.find_by_id(params[:id])
    @user = Helpers.current_user(session)
    erb :"/notes/clientsNotesNew", :layout => :"/layouts/landing"
  end

  get "/cases/:id/notes/new" do
    @case = Case.find_by_id(params[:id])
    @user = Helpers.current_user(session)
    erb :"/notes/casesNotesNew", :layout => :"/layouts/landing"
  end

  post "/clients/:id/notes" do
    @client = Client.find_by_id(params[:id])
    @note = Note.create(params[:note])
    @note.save
    redirect "/clients/#{@client.id}"
  end

  post "/cases/:id/notes" do
    @case = Case.find_by_id(params[:id])
    @note = @case.notes.create(params[:note])
    @note.save
    redirect "/cases/#{@case.id}"
  end

  post "/notes" do
    @note = Note.create(params[:note])
    @note.save
    redirect "/notes"
  end

  # READ
  get "/notes/:id" do
    @note = Note.find_by_id(params[:id])
    erb :"/notes/show", :layout => :"/layouts/landing"
  end

  # UPDATE
  get "/notes/:id/edit" do
    @note = Note.find_by_id(params[:id])
    
    erb :"/notes/edit", :layout => :"/layouts/landing"
  end

  post "/notes/:id" do
      @note = Note.find_by_id(params[:id])
      if session[:user_id] == @note.owner
        @note.update(params[:note])
        @note.save
        flash[:green] = {:title => "Success", :text => "Successfully updated note"}
        redirect "/notes/#{@note.id}"
      else
        flash[:red] = {:title => "Failure", :text => "Cannot update another users resource"}
        redirect "/notes/#{@note.id}"
      end
    
  end

  # DELETE
  post "/notes/:id/delete" do
    @note = Note.find_by_id(params[:id])
    if session[:user_id] == @note.owner
      @note.destroy
      flash[:green] = {:title => "Success", :text => "Successfully deleted note"}
      redirect "/dashboard"
    else
      flash[:red] = {:title => "Failure", :text => "Cannot delete other users' notes"}
      redirect "/notes/#{@note.id}"
    end

  end



end
