require_relative '../book'

class CreateBook
  def create_book
    puts 'Title:'
    title = gets.capitalize.chomp
    puts 'Author:'
    author = gets.capitalize.chomp
    Book.new(title, author)
  end
end
