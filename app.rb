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

# get('/success') do
#   @tasks = Task.all()
# end

post('/success') do
  @tasks = Task.all()
  description = params.fetch('description')
  new_task = Task.new({:description => description, :list_id => nil})
  new_task.save()
  erb(:index)

end
