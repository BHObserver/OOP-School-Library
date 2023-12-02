require './person'

class Teacher < Person
  def initialize(id, specialization, age = 0, name: 'Unknown', parent_permission: true)
    super(id, specialization, age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
