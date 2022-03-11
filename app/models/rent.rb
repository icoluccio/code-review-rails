class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :rent_in, :rent_out, presence: true
end
