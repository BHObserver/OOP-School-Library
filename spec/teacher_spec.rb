require_relative '../teacher'

describe Teacher do
  let(:teacher) { described_class.new('Math', 30, parent_permission: true, name: 'John Doe') }

  it 'checks attributes' do
    expect(teacher.age).to eq(0)
    expect(teacher.name).to eq('John Doe')
  end
end
