require 'rails_helper'

module OpenLibraryBooksServiceMock
  def retrieve_book_information_by_isbn_success
    data_body = File.read(Rails.root.join('spec',
                                          'support',
                                          'mocks_and_stubs',
                                          'book_information_success_stub.json'))

    stub_request(:get, 'https://openlibrary.org/api/books')
      .with(
        query:
          { bibkeys: 'ISBN:0451526538', format: 'json', jscmd: 'data' }
      ).to_return(status: 200, body: data_body)
  end

  def retrieve_book_information_not_found
    stub_request(:get, 'https://openlibrary.org/api/books')
      .with(
        query:
          { bibkeys: 'ISBN:9999999999', format: 'json', jscmd: 'data' }
      ).to_return(status: 404, body: '{}')
  end

  def retrieving_book_information_bad_request
    stub_request(:get, 'https://openlibrary.org/api/books')
      .with(
        query:
          { bibkeys: 'ISBN:123', format: 'json', jscmd: 'data' }
      ).to_return(status: 400, body: '{}')
  end
end
