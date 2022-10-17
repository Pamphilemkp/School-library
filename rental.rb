class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    @person.save_rental(self)
    @book.save_rental(self)
  end

  def add_person(person)
    person.add_rental(self)
  end

  def add_book(book)
    book.add_rental(self)
  end
end
