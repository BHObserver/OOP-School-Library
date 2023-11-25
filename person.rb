class Person
  attr_accessor :name
  attr_reader :students, :rentals

  def initialize(name)
    @name = name
    @students = []
    @rentals = []
  end

  def add_student(student)
    @students << student
  end

  def add_rental(rental)
    @rentals << rental
  end
end
