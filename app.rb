require './data/create_book'
require './data/create_person'
require './student'
require './teacher'
require './book'
require './rental'
require './person'
require './display_choice'
require 'json'

class App
  def initialize
    @books = []
    @book_save = []
    @people = []
    @people_save = []
    @rentals = []
    @exit = false
    @display_choice = Displaychoice.new
  end

  def run
    user_input until @exit
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def user_input
    puts '=============================='
    @display_choice.display_choice
    puts '=============================='

    puts 'Enter your choice:'
    choice = gets.chomp.to_i

    case choice
    when 1 then list_of_books
    when 2 then list_of_people
    when 3 then CreatePerson.people(@people)
    when 4 then @books.push(Create_book.new.create_book)
    when 5 then create_rental
    when 6 then list_all_rentals
    when 7 then @exit = true
    else
      puts 'Incorrect choice, please try to enter a correct number'
    end
  end

  def list_of_books
    if @books.empty?
      puts 'There is no book in the library'
    else
      puts 'List of all books'
      @books.each do |book|
        puts "Title :#{book.title},  Author: #{book.author}"

        book_obj = {
          title: book.title,
          author: book.author
        }
        @book_save.push(book_obj)

        File.write('books_save.json', JSON.generate(@book_save))
      end
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  def list_of_people
    if @people.empty?
      puts 'No person rented a book from the library'
    else

      puts 'List of all people'
      @people.each do |person|
        puts "#{person.name} (id: #{person.id}), age: #{person.age}"

        people_obj = {
          id: person.id,
          name: person.name,
          age: person.age
        }
        @people_save << people_obj
        File.write('./people_save.json', JSON.generate(@people_save))
      end
    end
  end

  def create_rental
    list_of_people
    puts 'Enter person id:'
    id = gets.chomp.to_i
    person = @people.find { |prson| prson.id == id }
    if person.nil?
      puts "Person with id: #{id} not found, please try again"
    else
      list_of_books
      puts 'Enter book title:'
      title = gets.capitalize.chomp
      book = @books.find { |f_book| f_book.title = title }
      if book.nil?
        puts "Boook with title: #{title} not found, please try again"
      else
        puts 'Enter rental date (YYYY-MM-DD):'
        date = gets.chomp
        @rentals << Rental.new(date, book, person)
      end
    end
  end

  def list_all_rentals
    list_of_people
    puts 'Enter person id:'
    id = gets.chomp.to_i
    person = @people.find { |prson| prson.id == id }
    puts person
    if person.nil?
      puts "Person with id: #{id} not found, please try again"
    elsif person.rentals.empty?
      puts "No rentals for #{person.name}"
    else
      puts "Rentals for #{person.name}:"
      person.rentals.each do |rental|
        puts "Date: #{rental.date}"
      end
    end
  end
end
