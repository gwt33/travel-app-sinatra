class UsersController < ApplicationController

  get '/signup' do
    erb :"/users/signup"
  end

  post '/signup' do
    @user = User.new(params["user"])
    if @user.save
      session[:user_id] = @user.id
      redirect "/destinations"
    else
      @errors = @user.errors.full_messages
      erb :"/users/login"
    end  
  end
  
  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      # creates a session cookie in web browser
      session[:user_id] = user.id   # <-- this logs someone
      redirect '/destinations'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end