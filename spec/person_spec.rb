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
