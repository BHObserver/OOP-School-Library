# rental_spec.rb

require_relative 'rental'
require_relative 'book'
require_relative 'person'

describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(25, 'John Doe') }
  let(:rental_date) { '2023-01-15' }

  let(:rental) { described_class.new(rental_date, book, person) }

  it 'has attributes set correctly' do
    expect(rental.date).to eq(rental_date)
    expect(rental.book).to eq(book)
    expect(rental.person).to eq(person)
  end

  it 'updates the book and person rentals lists' do
    expect(book.rentals).to include(rental)
    expect(person.rentals).to include(rental)
  end
end
