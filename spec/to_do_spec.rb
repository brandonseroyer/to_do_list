require ('rspec')
require ('to_do')
require('pg')

DB = PG.connect({:dbname => 'to_do_list_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Task) do
  describe("#description") do
    it("gives the description of the task") do
      test_description = Task.new({:description => "scrub the zebra"})
      expect(test_description.description()).to(eq("scrub the zebra"))
    end
  end

  describe("#save") do
    it("saves description for a task") do
      test_description = Task.new({:description => "feed the lion"})
      test_description.save()
      expect(Task.all()).to(eq([test_description]))
    end
  end

  describe(".all") do
    it("creates an array to save in") do
    expect(Task.all()).to(eq([]))
    end
  end

  describe("list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn sql", :list_id => 1})
      expect(test_task.list_id()).to(eq(1))
    end
  end

end
