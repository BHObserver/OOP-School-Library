# classroom_spec.rb
require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  let(:classroom_label) { 'Math Class' }
  let(:classroom) { described_class.new(classroom_label) }

  describe '#initialize' do
    it 'creates a new Classroom instance' do
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'sets the label' do
      expect(classroom.label).to eq(classroom_label)
    end

    it 'initializes an empty students array' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    let(:student_name) { 'Alice' }
    let(:student_age) { 16 }
    let(:student) { Student.new(student_name, student_age) }

    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom for the student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
