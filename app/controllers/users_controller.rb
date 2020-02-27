class UsersController < ApplicationController

        get '/login' do
          erb :login
      end

      post '/login' do

      end

      get '/signup' do
          erb :signup
      end

      post '/users' do

      end

      get '/users/:id' do
        
      end

      get '/logout' do
          session.clear
          redirect '/'
      end
end
