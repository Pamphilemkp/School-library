require_relative '../book'

describe('checking books') do
    it("should return an oject containing the author and title") do 
      book = Book.new('48 laws of power', 'Robert Green')
      expect( book.title && book.author).to eq('48 laws of power' && 'Robert Green')
    end
 end 