# person_correct_name_spec.rb
require_relative '../person'

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
