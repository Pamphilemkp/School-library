require_relative '../person'
require_relative '../decorator'
require_relative '../capitalize'
require_relative '../trimmer'

describe('testing the decorator pattern') do
  
    person = Person.new(21, "maximillimus", parent_permission: false)

         it 'checking the person correct name' do
            name = person.correct_name
            expect(name).to eql("maximillimus")
          end

       it("capitalize the name") do
        capitalize_name = CapitalizeDecorator.new(person)
        expect(capitalize_name.correct_name).to eql("Maximillimus")
       end

       it("trim the name") do
        trimmer_name = TrimmerDecorator.new(person)
        expect(trimmer_name.correct_name).to eql("maximillim")
     end
 end 