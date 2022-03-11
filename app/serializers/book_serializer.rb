class BookSerializer < ActiveModel::Serializer
  attributes :id,
             :genre,
             :author,
             :title,
             :publisher,
             :year,
             :image
end
