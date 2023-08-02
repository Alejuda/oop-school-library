require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  let(:person) { Person.new(25, name: 'Nacho')}
  let(:book) { Book.new('Title', 'Author')}
  let(:rental) { Rental.new('2023-04-20', book, person) }

  describe '#new' do
    it 'returns a Rental object' do
      expect(rental).to be_an_instance_of(Rental)
    end
  end
end
