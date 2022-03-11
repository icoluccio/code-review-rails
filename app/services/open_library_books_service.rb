class OpenLibraryBooksService
  include HTTParty
  base_uri 'https://openlibrary.org'

  def retrieve_book_information_by_isbn(isbn)
    path = '/api/books'
    options = { query: { bibkeys: isbn, format: 'json', jscmd: 'data' } }

    book_response = self.class.get(path, options)

    code_errors_raise(book_response)

    JSON.parse(book_response.body)[isbn].deep_symbolize_keys
        .slice(:title, :subtitle, :number_of_pages, :authors)
  end

  def code_errors_raise(response)
    raise 'Not found 404' if response.code == 404

    raise 'Bad request 400' if response.code == 400

    raise 'Request timeout 408' if response.code == 408

    raise response.response unless response.success?
  end
end
