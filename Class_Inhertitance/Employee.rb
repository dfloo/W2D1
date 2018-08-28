class Employee
  attr_accessor :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, assignees)
    @assignees = assignees
    super
  end
end