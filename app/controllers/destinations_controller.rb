class DestinationsController < ApplicationController

  # GET: /destinations
  get "/destinations" do
    @destinations = Destination.all
    erb :"/destinations/index"
  end

  # GET: /destinations/new
  get "/destinations/new" do
    erb :"/destinations/new"
  end

  # POST: /destinations
  post "/destinations" do
    @destination = Destination.new(params["destination"])
    if @destination.save
      redirect "/destinations"
    else
      @errors = @destination.error.full_messages
      erb :"/destination/new"
    end
  end

  # GET: /destinations/5
  get "/destinations/:id" do
    @destination = Destination.find_by_id(params[:id])
    erb :"/destinations/show"
  end

  # GET: /destinations/5/edit
  get "/destinations/:id/edit" do
    @destination = Destination.find_by_id(params[:id])
    erb :"/destinations/edit"
  end

  # PATCH: /destinations/5
  patch "/destinations/:id" do
    @destination = Destination.find_by_id(params[:id])
    if @destination.update(params[:destination])
      redirect "/destinations/#{@destination.id}"
    else
      erb :'/authors/edit'
    end
  end

  # DELETE: /destinations/5/delete
  delete "/destinations/:id/delete" do
    @destination = Destination.find_by_id(params[:id])
    if @destination
      @destination.destroy 
    end
      redirect '/destinations'
  # end
end
