require_relative '../person'

describe('checking person details') do
    context("should return the details about the person") do 
        
        person = Person.new(21, "John Doe", parent_permission: false)

         it 'Initialized with name, age and parent_permission' do
            age = person.age
            name = person.name

            expect(person.parent_permission).to be_falsy
            expect(age).to be(21)
            expect(name).to eq("John Doe")
          end

       it("It should return true if the teacher has permission for the service") do
          expect(person.can_use_services?).to be_falsy
       end

       it("It should return the correct name") do
        expect(person.correct_name).to eq("John Doe")
     end
    end
 end 