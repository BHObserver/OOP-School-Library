# spec/person_spec.rb
require_relative 'person'
require_relative 'rental'

describe Person do
  let(:person) { Person.new(20, 'John Doe') }

  describe '#initialize' do
    it 'creates a new person with the given age and name' do
      expect(person.age).to eq(20)
      expect(person.name).to eq('John Doe')
    end

    it 'generates a random ID for the person' do
      expect(person.id).to be_an(Integer)
    end

    it 'initializes rentals as an empty array' do
      expect(person.rentals).to be_empty
    end
  end
end
