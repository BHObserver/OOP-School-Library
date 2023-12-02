# student_spec.rb

require_relative '../student'

describe Student do
  let(:student) { described_class.new(15, 'Math Class', name: 'Jane Doe', parent_permission: true) }

  it 'checks attributes' do
    expect(student.age).to eq(15)
    expect(student.name).to eq('Jane Doe')
    expect(student.instance_variable_get(:@parent_permission)).to be_truthy
    expect(student.classroom).to eq('Math Class')
  end

  it 'checks play_hooky method' do
    expect(student.play_hooky).to eq('¯\(ツ)/¯')
  end
end
