require_relative './config/environment'
require 'sinatra/activerecord/rake'


desc "rake console"
task :console do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    Pry.start
end

desc "Start the server"
task :server do
  exec "rerun -b 'rackup config.ru'"
end