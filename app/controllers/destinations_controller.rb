class DestinationsController < ApplicationController

  # GET: /destinations
  get "/destinations" do
    erb :"/destinations/index.html"
  end

  # GET: /destinations/new
  get "/destinations/new" do
    erb :"/destinations/new.html"
  end

  # POST: /destinations
  post "/destinations" do
    redirect "/destinations"
  end

  # GET: /destinations/5
  get "/destinations/:id" do
    erb :"/destinations/show.html"
  end

  # GET: /destinations/5/edit
  get "/destinations/:id/edit" do
    erb :"/destinations/edit.html"
  end

  # PATCH: /destinations/5
  patch "/destinations/:id" do
    redirect "/destinations/:id"
  end

  # DELETE: /destinations/5/delete
  delete "/destinations/:id/delete" do
    redirect "/destinations"
  end
end
