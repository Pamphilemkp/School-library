require_relative '../rental'
require_relative '../app'

class CreateRental
  # rubocop:disable Metrics/PerceivedComplexity
  def rental(people, books)
    people.each do |person|
      puts "#{person.name} (id: #{person.id}), age: #{person.age}"
    end

    puts 'Enter person id:'
    id = gets.chomp.to_i
    person = people.find { |prson| prson.id == id }
    if person.nil?
      puts "Person with id: #{id} not found, please try again"
    else
      books.each do |book|
        puts "Title :#{book.title},  Author: #{book.author}"
      end
      puts 'Enter book title:'
      title = gets.capitalize.chomp
      book = books.find { |f_book| f_book.title = title }
      if book.nil?
        puts "Boook with title: #{title} not found, please try again"
      else
        puts 'Enter rental date (YYYY-MM-DD):'
        date = gets.chomp

        Rental.new(date, book, person)
      end
    end
  end
  # rubocop:enable Metrics/PerceivedComplexity
end
