require 'rails_helper'

RSpec.describe OpenLibraryBooksService, type: :service do
  describe '#retrieve_book_information' do
    subject(:service) do
      OpenLibraryBooksService.new.retrieve_book_information_by_isbn(isbn)
    end
    context 'when the external service responds successfully' do
      let(:path) { 'https://openlibrary.org/api/books' }
      let(:isbn) { 'ISBN:0451526538' }

      before do
        retrieve_book_information_by_isbn_success
        service
      end

      it 'makes a request with the correct path and params' do
        expect(WebMock).to have_requested(:get, path)
          .with(query: { bibkeys: isbn, format: 'json', jscmd: 'data' })
      end

      it 'returns a hash with the correct title' do
        expect(service[:title]).to eq('The adventures of Tom Sawyer')
      end
    end

    context 'when the external service returns not found' do
      let(:isbn) { 'ISBN:9999999999' }

      it 'raises a Not found 404 error' do
        retrieve_book_information_not_found
        expect { service }.to raise_error('Not found 404')
      end
    end

    context 'when the external service returns bad request' do
      let(:isbn) { 'ISBN:123' }

      it 'raises a Bad request 400 error' do
        retrieving_book_information_bad_request
        expect { service }.to raise_error('Bad request 400')
      end
    end
  end
end
