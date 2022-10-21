require_relative '../classroom '

describe('checking student classroom') do
    it("should return the classroom") do 
      classroom = Classroom.new('8-P')
      expect(classroom.label).to eq('8-P')
    end
 end 