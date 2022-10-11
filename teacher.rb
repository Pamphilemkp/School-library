require './person.rb'

# Inherit from person
class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, name = "Unknown", age, parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
