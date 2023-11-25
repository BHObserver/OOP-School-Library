require './person'
require './student'
require './teacher'
require './book'
require './rental'
require 'date'

# App class for interface actions
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def book_list(show_index: false)
    if @books.empty?
      puts 'Sorry, the library is empty. Please add some books.'
    else
      @books.each_with_index do |book, index|
        puts "#{show_index ? index : ' '} Title: \"#{book.title}\", Author: \"#{book.author}\"."
      end
    end
    puts
  end
end
