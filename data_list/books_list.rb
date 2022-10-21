class BooksList
  def list_of_books(books)
    if books.empty?
      puts 'There is no book in the library'
    else
      puts 'List of all books'
      books.each do |book|
        puts "Title :#{book.title},  Author: #{book.author}"
      end
    end
  end
end
