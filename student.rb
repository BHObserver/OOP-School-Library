class Student
  attr_accessor :name, :classroom

  def initialize(name)
    @name = name
    @classroom = nil
  end

  def belongs_to_classroom(classroom)
    @classroom = classroom
    classroom&.add_student(self)
  end
end
