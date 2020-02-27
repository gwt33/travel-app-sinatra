class UsersController < ApplicationController

  get '/signup' do
    erb :"/signup/new"
  end

  post '/signup' do
    @user = User.new(params["user"])
    if user.save
      session[:user_id] = user.id
      redirect "/destinations"
    else
      @errors = user.error.full_messages
      erb :"/user/new"
    end  
  end
  
  get '/login' do
    erb :'/users/new'
  end

  post '/login' do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id   # <-- this logs someone
      redirect '/destinations'
    else
      redirect '/users/new'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
