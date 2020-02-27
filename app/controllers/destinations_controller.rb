class DestinationsController < ApplicationController

  # GET: /destinations
  # READ or index route/action
  get "/destinations" do
    @destinations = Destination.all
    erb :"/destinations/index"
  end

  get '/destinations/new' do
    erb :'/destinations/new'
  end

  post '/destinations' do
    #create a new destination and save it to DB
    #only save a destination if there's content in it
    if !logged_in?
        redirect '/'
    end
    #only save a destination if there's a logged in user
    if params[:destination] != "" && params[:content] != ""
        @destination = Destination.create(destination: params[:destination], content: params[:content], user_id: current_user.id,)
        redirect "/destinations/#{@destination.id}"
    else
        redirect '/destinations/new'
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
    if logged_in?
      @destination = Destination.find_by_id(params[:id])
      if @destination.user_id == current_user.id
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
        erb :'/destinations/edit'
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