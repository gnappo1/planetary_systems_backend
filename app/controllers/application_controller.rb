require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :default_content_type, :json
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]

    # use Rack::Session::Cookie, :key => 'rack.session',
    #                             :path => '/',
    #                             :secret => ENV["SESSION_SECRET"]
  end
  
  # error ActiveRecord::RecordNotFound do
  #   "Record could not be found with id #{params[:id]}".to_json
  # end
  
  get "/" do
    "No homepage in this Sinatra API app"
  end

  get "/me" do
    # I used the ||= operator next line, can you guess why? What does ||= do?
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    if @current_user
      halt 200, {user: @current_user}.to_json
    else
      halt 400, {message: "No one is logged in!"}.to_json
    end
  end

end