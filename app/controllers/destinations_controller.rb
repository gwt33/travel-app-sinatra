class DestinationsController < ApplicationController

  # GET: /destinations
  # READ or index route/action
  get "/destinations" do
    @destinations = Destination.all
    erb :"/destinations/index"
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
    if logged_in?
      @destination = Destination.find_by_id(params[:id])
      if @user == current_user
        erb :"/destinations/edit"
      else
        redirect '/'
      end
    else
      redirect '/login'
    end
  end

  # PATCH: /destinations/5
  # destinations update action
  patch "/destinations/:id" do
    @destination = Destination.find_by_id(params[:id])
    if logged_in?
      if @destination.update(params[:destination])
        redirect "/destinations/#{@destination.id}"
      else
        erb :'/authors/edit'
      end
    else
      redirect '/login'
    end
  end

  # DELETE: /destinations/5/delete
  delete "/destinations/:id/delete" do
    @destination = Destination.find_by_id(params[:id])
    if @destination.user_id == current_user.id
      @destination.destroy 
      redirect '/destinations'
    end
      redirect '/destinations'
  end
end

# get request renders a page to show something
# patch, post delete ends in a redirect or ONLY shows errors

# params gets populated by:
# form input data
# by dynamic route variables