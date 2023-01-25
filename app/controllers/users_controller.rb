class UsersController < ApplicationController

    post "/signup" do
        user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password])
        if user.id
            session[:user_id] = user.id
            halt 201, {user: user}.to_json
        else
            halt 400, {message: user.errors.full_messages.to_sentence}.to_json
        end
    end


end