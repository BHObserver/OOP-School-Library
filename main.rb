# main.rb

# Require your class files
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'person'

# Create instances
classroom = Classroom.new('Math Class')
student = Student.new('John Doe')
Book.new('Ruby Basics', 'John Smith')
person = Person.new('Alice')

# Add student to classroom
classroom.add_student(student)

# Set classroom for student
student.classroom = classroom

# Create a rental
book = Book.new('Ruby Basics', 'John Smith')
Rental.new('2023-11-24', person, book)


# Output information
puts "Classroom: #{classroom.label}"
puts "Students in Classroom: #{classroom.students.map(&:name)}"

puts "\nStudent: #{student.name}"
puts "Classroom for Student: #{student.classroom&.label}"

puts "\nBook: #{book.title} by #{book.author}"
puts "Person: #{person.name}"
puts "Rentals for Person: #{person.rentals.map { |rental| "#{rental.book.title} on #{rental.date}" }}"

puts "Book: #{book.title} by #{book.author}"
puts "Rentals for Book: #{book.rentals.map { |rental| "#{rental.person.name} on #{rental.date}" }}"
