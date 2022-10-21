class CreatePerson
  class << self
    def student
      puts 'enter classroom:'
      classroom = gets.capitalize.chomp
      puts 'Age:'
      age = gets.chomp.to_i
      puts 'Name:'
      name = gets.capitalize.chomp
      puts 'Has permission? [Y/N]'
      permission = gets.capitalize.chomp
      if permission == 'Y'
        Student.new(classroom, age, name, parent_permission: true)
      else
        Student.new(classroom, age, name, parent_permission: false)
      end
    end

    def teacher
      puts 'enter specialization:'
      specialization = gets.capitalize.chomp
      puts 'Age:'
      age = gets.chomp.to_i
      puts 'Name:'
      name = gets.capitalize.chomp
      Teacher.new(specialization, age, name)
    end

    def people(list)
      puts 'Do you want to create a student(1) or a teacher(2)?'
      number = gets.chomp.to_i

      case number
      when 1
        list.push(student)
        puts 'Student created successfully!'
      when 2
        list.push(teacher)
        puts 'Teacher created successfully!'
      else
        puts 'Input not valid. Please enter a valid input (1) or (2)'
      end
    end
  end
end
