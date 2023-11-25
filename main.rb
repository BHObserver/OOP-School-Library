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

person = Person.new('Teacher Bob')

student1 = Student.new('John Doe')
student2 = Student.new('Jane Smith')

person.add_student(student1)
person.add_student(student2)

classroom = Classroom.new('Math Class')

student1.belongs_to_classroom(classroom)
student2.belongs_to_classroom(classroom)

puts "Person: #{person.name}"
puts "Students for Person: #{person.students.map(&:name)}"
puts "Classroom for Student1: #{student1.classroom&.label}"
puts "Classroom for Student2: #{student2.classroom&.label}" # app.rb
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'person'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'List of Books:'
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_people
    puts 'List of People:'
    @people.each { |person| puts "#{person.name} (ID: #{person.id})" }
  end

  def create_person(type)
    puts "Enter name for the #{type}:"
    name = gets.chomp
    case type
    when 'teacher'
      puts 'Enter specialization:'
      specialization = gets.chomp
      @people << Teacher.new(@people.size + 1, specialization, name: name)
    when 'student'
      @people << Student.new(@people.size + 1, name)
    else
      puts 'Invalid person type.'
    end
  end

  def create_book
    puts 'Enter title of the book:'
    title = gets.chomp
    puts 'Enter author of the book:'
    author = gets.chomp
    @books << Book.new(title, author)
  end

  def create_rental
    puts 'Enter person ID for the rental:'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    unless person
      puts 'Person not found.'
      return
    end

    puts 'Enter book title for the rental:'
    book_title = gets.chomp
    book = @books.find { |b| b.title == book_title }
    unless book
      puts 'Book not found.'
      return
    end

    puts 'Enter rental date (YYYY-MM-DD):'
    rental_date = gets.chomp
    @rentals << Rental.new(rental_date, person, book)
  end

  def list_rentals_for_person
    puts 'Enter person ID to list rentals:'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    unless person
      puts 'Person not found.'
      return
    end

    puts "Rentals for #{person.name}:"
    rentals = @rentals.select { |rental| rental.person == person }
    rentals.each { |rental| puts "#{rental.book.title} on #{rental.date}" }
  end
end

# Entry point
app = App.new
app.main

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
