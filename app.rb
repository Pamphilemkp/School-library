require './data/create_book'
require './data/create_person'
require_relative './data/create_rental'
require_relative './data_list/people_list'
require_relative './data_list/books_list'
require_relative './data_list/rentals_list'
require './file_write'
require_relative './file_read'
require './student'
require './teacher'
require './book'
require './rental'
require './person'
require './display_choice'
require 'json'

class App
  def initialize
    @books = FileRead.books
    @people = FileRead.people
    @rentals = FileRead.rentals(@people, @books)
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
    when 1 then BooksList.new.list_of_books(@books)
    when 2 then PeopleList.new.list_of_people(@people)
    when 3 then CreatePerson.people(@people)
    when 4 then @books.push(CreateBook.new.create_book)
    when 5 then @rentals << CreateRental.new.rental(@people, @books)
    when 6 then RentalsList.new.list_all_rentals(@people, @rentals)
    when 7 then FileWrite.books(@books)
                FileWrite.people(@people)
                FileWrite.rentals(@rentals)
                @exit = true
    else
      puts 'Incorrect choice, please try to enter a correct number'
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
end
