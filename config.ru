require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::Cors do
  allow do
    origins "*"
    resource "*", headers: :any, methods: [:get, :post, :patch, :put, :delete]
  end
end

use Rack::JSONBodyParser
run ApplicationController
use PlanetsController
use SystemsController
