class NotesController < ApplicationController

  # GET: /notes
  get "/notes" do
    @notes = Note.all
    erb :"/notes/index", :layout => :"/layouts/landing"
  end

  # GET: /notes/new
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
    @note = @client.notes.create(params[:note])
    @note.save
    redirect "/clients/#{@client.id}"
  end

  post "/cases/:id/notes" do
    @case = Case.find_by_id(params[:id])
    @note = @case.notes.create(params[:note])
    @note.save
    redirect "/cases/#{@case.id}"
  end

  # POST: /notes
  post "/notes" do
    @note = Note.create(params[:note])
    @note.save
    redirect "/notes"
  end

  # GET: /notes/5
  get "/notes/:id" do
    @note = Note.find_by_id(params[:id])
    erb :"/notes/show", :layout => :"/layouts/landing"
  end

  # GET: /notes/5/edit
  get "/notes/:id/edit" do
    @note = Note.find_by_id(params[:id])
    erb :"/notes/edit", :layout => :"/layouts/landing"
  end

  # PATCH: /notes/5
  post "/notes/:id" do
      @note = Note.find_by_id(params[:id])
      if session[:user_id] == @note.owner
        @note.update(params[:note])
        @note.save
      else
        flash[:notice] = "Cannot update another users resource"
        redirect "/notes/:id"
      end
    
  end

  # DELETE: /notes/5/delete
  post "/notes/:id/delete" do
    @note = Note.find_by_id(params[:id])
    if Helpers.current_user(session) == @note.owner
      @note.destroy
      flash[:success] = "Successfully deleted note"
      redirect "/dashboard"
    else
      flash[:nodel] = "Cannot delete other users notes"
      redirect "/dashboard"
    end

  end



end
