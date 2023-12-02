# book_spec.rb

require_relative 'book'

RSpec.describe Book do
  let(:title) { 'Test Title' }
  let(:author) { 'Test Author' }
  let(:book) { described_class.new(title, author) }

  describe '#initialize' do
    it 'creates a new book with the given title and author' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    let(:rental) { instance_double('Rental') }

    it 'adds a rental to the book' do
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
