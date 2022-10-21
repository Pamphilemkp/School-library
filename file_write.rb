class FileWrite
  class << self
    def books(books)
      @book_save = []
      books.each do |book|
        book_obj = {
          title: book.title,
          author: book.author
        }
        @book_save.push(book_obj)

        File.write('books_save.json', JSON.generate(@book_save))
      end
    end

    def people(people)
      @people_save = []
      people.each do |person|
        people_obj = {
          id: person.id,
          name: person.name,
          age: person.age
        }
        @people_save << people_obj
        File.write('./people_save.json', JSON.generate(@people_save))
      end
    end

    def rentals(rentals)
      @rental_save = []
      rentals.each do |rental|
        rental_obj = {
          date: rental.date
        }
        @rental_save << rental_obj
        File.write('./rental_save.json', JSON.generate(@rental_save))
      end
    end
  end
end
