require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :default_content_type, :json

    # enable :sessions
    # set :session_secret, SecureRandom.hex(13)
    # set :views, 'app/views'
  end

  # error ActiveRecord::RecordNotFound do
  #   "Record could not be found with id #{params[:id]}".to_json
  # end

  get "/" do
    "Welcome"
  end

end