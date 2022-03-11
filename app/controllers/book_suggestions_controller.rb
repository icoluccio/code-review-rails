class BookSuggestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    book_suggestion = BookSuggestion.new(book_suggestion_params)

    if book_suggestion.save
      render json: book_suggestion,
             serializer: BookSuggestionSerializer, status: :created

    else
      render plain: 'Error creating book suggestion', status: :bad_request
    end
  end

  private

  def book_suggestion_params
    params.require(:book_suggestion).permit(:synopsis, :price,
                                            :author, :title,
                                            :link, :editor,
                                            :year, :user_id)
  end
end
