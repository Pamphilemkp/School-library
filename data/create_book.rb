require_relative '../book'

class Create_book
  def create_book
    puts 'Title:'
    title = gets.capitalize.chomp
    puts 'Author:'
    author = gets.capitalize.chomp
    book = Book.new(title, author)
    book
  end
end