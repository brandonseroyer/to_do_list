require('sinatra')
require('sinatra/reloader')
require('./lib/to_do')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "to_do_list"})

get('/') do
  @tasks = Task.all()
  erb(:index)
end
