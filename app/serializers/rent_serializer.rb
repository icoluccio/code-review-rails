class RentSerializer < ActiveModel::Serializer
  attributes :rent_in, :rent_out

  belongs_to :user
  belongs_to :book
end
