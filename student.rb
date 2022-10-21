require './person'

# Inherit from person
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  # File 'lib/rubocop/cop/style/redundant_regexp_escape.rb', line 18
  def play_hooky
    "¯\(ツ)/¯"
  end
end
