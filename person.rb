class Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private_class_method def self.of_age?
    @age >= 18
  end

  def can_use_services?
    @age >= 18 && @parent_permission
  end
end
