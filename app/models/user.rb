# frozen_string_literal: true

class User < ApplicationRecord
  has_many :rents, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates :first_name, :last_name, presence: true
end
