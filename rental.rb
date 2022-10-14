class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    add_person(person)
    add_book(book)
  end

  def add_person(person)
    person.add_rental(self)
  end

  def add_book(book)
    book.add_rental(self)
  end
end
