class PeopleList
  def list_of_people(people)
    if people.empty?
      puts 'No person rented a book from the library'
    else

      puts 'List of all people'
      people.each do |person|
        puts "#{person.name} (id: #{person.id}), age: #{person.age}"
      end
    end
  end
end
