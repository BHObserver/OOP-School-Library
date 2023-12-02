require './person'

class Teacher < Person
  def initialize(id, specialization, _age = 0, name: 'Unknown', parent_permission: true)
    super(id, name, parent_permission: parent_permission)
    @specialization = specialization
    @age = 0
  end

  def can_use_services?
    true
  end
end
