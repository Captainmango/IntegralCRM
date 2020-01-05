class NotesController < ApplicationController

  # GET: /notes
  get "/notes" do
    erb :"/notes/index.html"
  end

  # GET: /notes/new
  get "/notes/new" do
    erb :"/notes/new.html"
  end

  # POST: /notes
  post "/notes" do
    redirect "/notes"
  end

  # GET: /notes/5
  get "/notes/:id" do
    erb :"/notes/show.html"
  end

  # GET: /notes/5/edit
  get "/notes/:id/edit" do
    erb :"/notes/edit.html"
  end

  # PATCH: /notes/5
  patch "/notes/:id" do
    redirect "/notes/:id"
  end

  # DELETE: /notes/5/delete
  delete "/notes/:id/delete" do
    redirect "/notes"
  end
end
