class BookSuggestionSerializer < ActiveModel::Serializer
  attributes :synopsis,
             :price,
             :author,
             :title,
             :link,
             :editor,
             :year,
             :user_id
end
