class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def save_rental(rental)
    @rentals.push(rental)
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
