class PlanetsController < ApplicationController

  # GET: /planets
  get "/planets" do
    erb :"/planets/index.html"
  end

  # GET: /planets/new
  get "/planets/new" do
    erb :"/planets/new.html"
  end

  # POST: /planets
  post "/planets" do
    redirect "/planets"
  end

  # GET: /planets/5
  get "/planets/:id" do
    erb :"/planets/show.html"
  end

  # GET: /planets/5/edit
  get "/planets/:id/edit" do
    erb :"/planets/edit.html"
  end

  # PATCH: /planets/5
  patch "/planets/:id" do
    redirect "/planets/:id"
  end

  # DELETE: /planets/5/delete
  delete "/planets/:id/delete" do
    redirect "/planets"
  end
end
