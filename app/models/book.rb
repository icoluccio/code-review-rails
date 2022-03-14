class Book < ApplicationRecord
  has_many :rents, dependent: :destroy

  validates :genre,
            :author,
            :title,
            :publisher,
            :year,
            :image,
            presence: true

  validates :title, length: { maximum: 25 }

  def get_all_books_with_author
    Book.all.select{|book| book.author.nil?}
  end

  def remove_all_books_without_author
    get_all_books_with_author.delete_all!
  end

  def show_as_string
    to_s
  end
end
