class BookSuggestion < ApplicationRecord
  belongs_to :user, optional: true

  validates :synopsis, :price, :author, :title, :link, :editor, :year, presence: true
end
