require ('rspec')
require ('to_do')

describe(Task) do
  describe("#description") do
    it("gives the description of the task") do
      test_description = Task.new({:description => "scrub the zebra"})
      expect(test_description.description()).to(eq("scrub the zebra"))

    end
  end
end
