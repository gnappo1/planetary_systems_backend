class SessionsController < ApplicationController

    post "/login" do
        user = User.find_by_email(params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id # we log them in
            halt 200, {user: user}.to_json
        else
            halt 400, {message: "Invalid credentials!"}.to_json
        end
    end

    delete "/logout" do
        session.delete(:user_id)
        halt 200, {message: "Successfully logged out!"}.to_json
    end

end