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
