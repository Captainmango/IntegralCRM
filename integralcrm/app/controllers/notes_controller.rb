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

  get "/clients/notes/new" do
    erb :"/notes/new", :layout => :"/layouts/landing"
  end

  get "/cases/notes/new" do
    erb :"/notes/new", :layout => :"/layouts/landing"
  end

  post "/clients/notes" do
    

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
        "Cannot update another users resource"
        redirect "/notes/:id"
      end
    
  end

  # DELETE: /notes/5/delete
  post "/notes/:id/delete" do
    @note = Note.find_by_id(params[:id])
    if session[:user_id] == @note.owner
      @note.destroy
      redirect "/landing"
    else
      "can't delete other users notes"
    end

  end



end
