require_relative '../classroom '
require_relative '../student'

describe('checking the student data') do
  context('should return the student details') do
    classroom = Classroom.new('8-P')
    student = Student.new(classroom, 21, 'john doe', parent_permission: false)

    it 'Initialized with name, age, id, parent_permission?' do
      name = student.name
      age = student.age
      parent_permission = student.parent_permission
      id = student.id
      classroom = student.classroom.label
      expect(name).to eq 'john doe'
      expect(age).to eq 21
      expect(classroom).to eq '8-P'
      expect(parent_permission).to be false
    end

    it 'student can play hooky' do
      play_hooky = student.play_hooky
      expect(play_hooky).to eq '¯/(ツ)/¯'
    end
  end
end
