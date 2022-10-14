require_relative 'student'
require_relative 'classroom'

student = Student.new(nil, 24, 'Pamphile')
classroom = Classroom.new('computer sciences')
puts student.classroom
student.classroom = classroom
puts student.classroom.label
