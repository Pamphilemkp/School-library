require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe('testing the decorator pattern') do
  person = Person.new(21, 'Pamphile', parent_permission: false)
  book = Book.new('48 laws of power', 'Robert Green')

  it 'cinitialize the rentals with the date' do
    rental = Rental.new('2022/10/22', person, book)
    person_name = person.name
    book_tile = book.title
    rental_date = rental.date

    expect(person_name).to eql('Pamphile')
    expect(book_tile).to eql('48 laws of power')
    expect(rental_date).to eql('2022/10/22')
  end
end
