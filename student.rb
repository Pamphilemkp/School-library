require './person.rb'

# Inherit from person
class Student < Person
 attr_accessor :classroom

    def initialize(classroom, name = "Unknown", age, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
   end

   def play_hooky
     "¯\(ツ)/¯"
   end
end
