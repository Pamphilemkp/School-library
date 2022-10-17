require './student'
require './teacher'
require './book'
require './rental'
require './person'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @exit = false
  end

  def run
    user_input until @exit
  end

  def display_choice
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given id'
    puts '7 - Exit'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def user_input
    puts '=============================='
    display_choice
    puts '=============================='

    puts 'Enter your choice:'
    choice = gets.chomp.to_i

    case choice
    when 1 then list_of_books
    when 2 then list_of_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_all_rentals
    when 7 then @exit = true
    else
      puts 'Incorrect choice, please try to enter a correct number'
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  def list_of_books
    if @books.empty?
      puts 'There is no book in the library'
    else
      puts 'List of all books'
      @books.each do |book|
        puts "Title :#{book.title},  Author: #{book.author}"
      end
    end
  end

  def list_of_people
    if @people.empty?
      puts 'There is no book in the library'
    else
      puts 'List of all people'
      @people.each do |person|
        puts "#{person.name} (id: #{person.id}), age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?'
    number = gets.chomp.to_i

    case number
    when 1
      puts 'enter classroom:'
      classroom = gets.capitalize.chomp
      puts 'Age:'
      age = gets.chomp.to_i
      puts 'Name:'
      name = gets.capitalize.chomp
      puts 'Has permission? [Y/N]'
      permission = gets.capitalize.chomp
      @people << if permission == 'Y'
                   Student.new(classroom, age, name, parent_permission: true)
                 else
                   Student.new(classroom, age, name, parent_permission: false)
                 end

    when 2
      puts 'enter specialization:'
      specialization = gets.capitalize.chomp
      puts 'Age:'
      age = gets.chomp.to_i
      puts 'Name:'
      name = gets.capitalize.chomp
      @people << Teacher.new(specialization, age, name)
      puts 'person created successful'

    else
      puts 'Invalid choice, please enter the correct choice'
    end
  end

  def create_book
    puts 'Title:'
    title = gets.capitalize.chomp
    puts 'Author:'
    author = gets.capitalize.chomp
    @books.push(Book.new(title, author))
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
