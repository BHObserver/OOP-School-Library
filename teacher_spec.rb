require_relative 'teacher'

describe Teacher do
  let(:teacher) { described_class.new(1, 'Math', 30, parent_permission: true, name: 'John Doe') }

  it 'checks attributes' do
    expect(teacher.id).to eq(1)
    expect(teacher.age).to eq(30)
    expect(teacher.name).to eq('John Doe')
    expect(teacher.parent_permission).to be_truthy
    expect(teacher.specialization).to eq('Math')
  end
end
