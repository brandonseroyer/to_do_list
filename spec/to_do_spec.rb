require ('rspec')
require ('to_do')

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
      expect(Tasks.all()).to(eq([test_description]))
    end
  end

  describe(".all") do
    it("creates an array to save in") do
    expect(Task.all()).to(eq([]))
    end
  end

end
