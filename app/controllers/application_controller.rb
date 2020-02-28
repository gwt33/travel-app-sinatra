require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "geraldstravelapp"
  end

  get "/" do
    erb :welcome
  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
      # @current_user ||= User.find(username: session[:username]) if session[:username]
    end
  end
end
