require 'rails_helper'

RSpec.describe BookSuggestionsController do
  describe 'POST #create' do
    context 'When create book suggestion' do
      let(:suggestion_params) { attributes_for(:book_suggestion) }
      subject(:http_response) do
        post :create,
             params: { book_suggestion: { synopsis: suggestion_params[:synopsis],
                                          price: suggestion_params[:price],
                                          author: suggestion_params[:author],
                                          title: suggestion_params[:title],
                                          link: suggestion_params[:link],
                                          editor: suggestion_params[:editor],
                                          year: suggestion_params[:year],
                                          user_id: suggestion_params[:user].id } }
      end

      it 'create successfully book suggestion' do
        expect(JSON.parse(http_response.body).to_json)
          .to eq BookSuggestionSerializer.new(BookSuggestion.last).to_json
      end

      it { is_expected.to have_http_status(201) }
    end

    context 'When creating an invalid book suggestion' do
      subject(:http_response) do
        post :create,
             params: { book_suggestion: { synopsis: nil, price: nil, author: nil,
                                          title: nil, link: nil, editor: nil,
                                          year: nil, user_id: nil } }
      end
      it 'doesn\'t create a book suggestion' do
        expect(http_response.body).to eq 'Error creating book suggestion'
      end

      it { is_expected.to have_http_status(400) }
    end
  end
end
