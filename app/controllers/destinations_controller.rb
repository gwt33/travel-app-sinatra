class DestinationsController < ApplicationController

  # GET: /destinations
  # READ or index route/action
  get "/destinations" do
    @destinations = Destination.all
    erb :"/destinations/index"
  end

  # GET: /destinations/new
  # New action ends in a render form
  get "/destinations/new" do
    erb :"/destinations/new"
  end

  # POST: /destinations
  # CREATE action for destinations
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
  # destination show action
  # dynamic route variable (:id)
  # params carries information
  get "/destinations/:id" do
    @destination = Destination.find_by_id(params[:id])
    erb :"/destinations/show"
  end

  # GET: /destinations/5/edit
  # destinations edit action
  get "/destinations/:id/edit" do
    @destination = Destination.find_by_id(params[:id])
    erb :"/destinations/edit"
  end

  # PATCH: /destinations/5
  # destinations update action
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

# get request renders a page to show something
# patch, post delete ends in a redirect or ONLY shows errors