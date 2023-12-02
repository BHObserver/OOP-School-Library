# classroom_spec.rb

require_relative 'classroom'
require_relative 'student'

describe Classroom do
  let(:classroom) { described_class.new('Math Room') }
  let(:student) { Student.new(15, 'Math Class', name: 'Jane Doe', parent_permission: true) }

  context 'when created' do
    it 'has a label and an empty list of students' do
      expect(classroom.label).to eq('Math Room')
      expect(classroom.students).to be_empty
    end
  end

  context 'when adding a student' do
    before do
      classroom.add_student(student)
    end

    it 'updates the list of students' do
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom attribute for the student' do
      expect(student.classroom).to eq(classroom)
    end
  end
end
