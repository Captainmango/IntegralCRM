require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

set :method_override, true


use TasksController
use NotesController
use CasesController
use ClientsController
use UsersController
run ApplicationController
