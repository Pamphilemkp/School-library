require_relative './people_list'

class RentalsList
  def list_all_rentals(people, rentals)
    people.each do |person|
      puts "#{person.name} (id: #{person.id}), age: #{person.age}"
    end
    puts 'Enter person id:'
    id = gets.chomp.to_i
    person = people.find { |prson| prson.id == id }
    puts person

    if person.nil?
      puts "Person with id: #{id} not found, please try again"
    elsif rentals.empty?
      puts "No rentals for #{person.name}"

    else
      puts "Rentals for #{person.name}:"
      rentals.each do |rental|
        puts "Date: #{rental.date} - Name: #{person.name} - Id: #{person.id}"
      end
    end
  end
end
