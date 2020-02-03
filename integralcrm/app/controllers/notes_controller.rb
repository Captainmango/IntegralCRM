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
    if @note.save
      flash[:green] = {:title => "Success", :text => "Successfully created note"}
      redirect "/clients/#{@client.id}"
    else
      flash[:red] = {:title => "Failure", :text => "Failed to create note"}
      redirect "/clients/#{@client.id}"
    end
  end

  post "/cases/:id/notes" do
    @case = Case.find_by_id(params[:id])
    @note = @case.notes.create(params[:note])
    @note.client_id = @case.client.id
    if @note.save
      flash[:green] = {:title => "Success", :text => "Successfully created note"}
      redirect "/cases/#{@case.id}"
    else
      flash[:red] = {:title => "Failure", :text => "Failed to create note"}
      redirect "/cases/#{@case.id}"
    end
  end

  post "/notes" do
    @note = Note.create(params[:note])
    @note.save
    redirect "/notes"
  end

  # READ
  get "/notes/:id" do
    @note = Note.find_by_id(params[:id])
    redir_if_not_found(@note)
    erb :"/notes/show", :layout => :"/layouts/landing"
  end

  # UPDATE
  get "/notes/:id/edit" do
    @note = Note.find_by_id(params[:id])
    if Helpers.current_user(session).id == @note.owner
      erb :"/notes/edit", :layout => :"/layouts/landing"
    else
      flash[:red] = {:title => "Failure", :text => "Cannot access this form. Cannot edit content"}
      redirect "/notes/#{@note.id}"
    end

  end

  patch "/notes/:id" do
      @note = Note.find_by_id(params[:id])
      if Helpers.current_user(session).id == @note.owner
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
  delete "/notes/:id/delete" do
    @note = Note.find_by_id(params[:id])
    if Helpers.current_user(session).id == @note.owner
      @note.destroy
      flash[:green] = {:title => "Success", :text => "Successfully deleted note"}
      redirect "/dashboard"
    else
      flash[:red] = {:title => "Failure", :text => "Cannot delete other users' notes"}
      redirect "/notes/#{@note.id}"
    end

  end



end
