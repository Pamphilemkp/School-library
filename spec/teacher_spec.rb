require_relative '../teacher'

describe('checking teacher details') do
  context('should return the details about the teacher') do
    teacher = Teacher.new('Algo and DS', 36, 'Georges Dupon')

    it 'Initialized with name, age and specialization' do
      specialization = teacher.specialization
      age = teacher.age
      name = teacher.name

      expect(specialization).to eql('Algo and DS')
      expect(age).to be(36)
      expect(name).to eql('Georges Dupon')
    end

    it('It should return true if the teacher has permission for the service') do
      expect(teacher.can_use_services?).to be_truthy
    end
  end
end
