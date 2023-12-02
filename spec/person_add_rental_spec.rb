# person_add_rental_spec.rb
require_relative '../person'
require_relative '../rental'
require_relative '../book'  # Make sure to require any necessary dependencies

RSpec.describe Person do
  let(:person_age) { 25 }
  let(:person_name) { 'John Doe' }
  let(:parent_permission) { true }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }  # Adjust with the appropriate Book class and initialization

  subject(:person) { described_class.new(person_age, person_name, parent_permission: parent_permission) }

  describe '#add_rental' do
    it 'creates a new rental' do
      rental_date = '2023-01-01'
      rental = person.add_rental(rental_date, book)

      expect(rental).to be_an_instance_of(Rental)
      expect(rental.date).to eq(rental_date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
end
