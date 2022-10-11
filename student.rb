require './person'

# Inherit from person
class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, parent_permission: true, name = 'Unknown')
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end