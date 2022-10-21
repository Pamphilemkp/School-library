require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require 'json'

class FileRead
  class << self
    def books
      books_save = []
      file_path = './storage/books_save.json'

      if File.exist?(file_path) && File.read(file_path) != ''
        books_data = JSON.parse(File.read(file_path))
        books_data.each do |book|
          add_book = Book.new(book['title'], book['author'])
          books_save.push(add_book)
        end
      end
      books_save
    end

    def people
      people_save = []
      file_path = './storage/people_save.json'

      if File.exist?(file_path) && File.read(file_path) != ''
        people_data = JSON.parse(File.read(file_path))
        people_data.each do |person|
          add_person = if person['specialization'].nil?
                         Student.new(person['age'], person['name'],
                                     parent_permission: person['parent_permission'])
                       else
                         Teacher.new(person['age'], person['specialization'], person['name'])
                       end
          people_save << add_person
        end

      end
      people_save
    end

    def rentals(people, books)
      rentals_save = []
      file_path = './rental_save.json'

      if File.exist?(file_path) && File.read(file_path) != ''
        rental_data = JSON.parse(File.read(file_path))
        rental_data.each do |rental|
          person_obj = people.select do |person|
            person.id == rental['person']
          end
          book_obj = books.select do |book|
            book.title.upcase == rental['book']
          end
          rentals_save.push(Rental.new(rental['date'], person_obj[0], book_obj[0]))
        end
      end
      rentals_save
    end
  end
end
