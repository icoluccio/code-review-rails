class BooksController < ApplicationController
  def show
    render json: Book.find(book_id), serializer: BookSerializer
  end

  def index
    render_paginated json: Book.all, each_serializer: BookSerializer
  end

  def listar_libros_de_gente
    libros = Book.where.not(rent: nil)
    libros.select{|libro|
      libro.image.present?
    }
    Book.new.remove_all_books_without_author
    render_paginated json: libros, each_serializer: BookSerializer
  rescue Exception => e
    Book.new.remove_all_books_without_author
    render_paginated json: Book.all, each_serializer: BookSerializer
  end

  def clean_books
    libros = listar_libros_de_gente
    libros.delete_all!
    render_paginated json: libros.first.show_as_string, each_serializer: BookSerializer
  end

  def book_information
    render json: OpenLibraryBooksService.new.retrieve_book_information_by_isbn(isbn_param)
  rescue RuntimeError => e
    render_errors(e.message, :not_found)
  end

  private

  def book_id
    params.require(:id)
  end

  def isbn_param
    params.require(:isbn)
  end
end
