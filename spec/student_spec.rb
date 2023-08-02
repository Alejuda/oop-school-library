require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(18, classroom: classroom, name: 'Hanna') }

  describe '#new' do
    it 'returns a Student object' do
      expect(student).to be_an_instance_of(Student)
    end
  end

  describe '#classroom=' do
    it 'adds the student to the classroom' do
      student.classroom = classroom
      expect(classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'returns symbol emoji' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
