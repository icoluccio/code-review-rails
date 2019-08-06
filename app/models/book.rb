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
end
