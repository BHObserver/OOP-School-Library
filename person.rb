class Person
  attr_reader :id, :name, :age

  def initialize(id, age = 0, parent_permission: true, name: "Unknown")
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end


end
