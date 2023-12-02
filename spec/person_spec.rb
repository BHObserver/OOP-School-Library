# person_spec.rb
require_relative '../person'

RSpec.describe Person do
  let(:person_age) { 25 }
  let(:person_name) { 'John Doe' }
  let(:parent_permission) { true }

  subject(:person) { described_class.new(person_age, person_name, parent_permission: parent_permission) }

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when the person is not of age but has parent permission' do
      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when the person is of age and has no parent permission' do
      it 'returns false' do
        expect(person.can_use_services?).to be(true)
      end
    end
  end
end

# person_add_rental_spec.rb
require_relative '../rental'
require_relative '../book' # Make sure to require any necessary dependencies

RSpec.describe Person do
  let(:person_age) { 25 }
  let(:person_name) { 'John Doe' }
  let(:parent_permission) { true }
  # Adjust with the appropriate Book class and initialization
  let(:book) do
    Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
  end
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

# person_correct_name_spec.rb

RSpec.describe Person do
  let(:person_age) { 25 }
  let(:person_name) { 'John Doe' }
  let(:parent_permission) { true }

  subject(:person) { described_class.new(person_age, person_name, parent_permission: parent_permission) }

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq(person_name)
    end
  end
end
