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
end
