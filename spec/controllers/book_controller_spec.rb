require 'rails_helper'

RSpec.describe BooksController do
  describe 'GET #index' do
    context 'GET routes checks' do
      it { should route(:get, '/books').to(action: :index) }
      it { should route(:get, '/books/1').to(action: :show, id: 1) }
    end

    context 'without authenticated user' do
      subject(:http_request) { get :index }
      it { should have_http_status(:unauthorized) }
    end

    context 'When you are looking all books' do
      include_context 'with authenticated user'
      let!(:books) { create_list(:book, 3) }
      subject!(:http_response) { get :index }

      it 'with a paginated json' do
        expect(JSON.parse(http_response.body)).to be_paginated
      end

      it 'with books answers in json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json

        expect(http_response.body) =~ JSON.parse(expected)
      end

      it { is_expected.to have_http_status(200) }
    end
  end

  describe 'GET #show' do
    context 'without authenticated user' do
      subject(:http_request) { get :index }
      it { should have_http_status(:unauthorized) }
    end
    context 'When you look a book with correct id' do
      include_context 'with authenticated user'
      let!(:book) { create(:book) }
      subject!(:http_response) { get :show, params: { id: book.id } }

      it 'with answers in json' do
        expect(JSON.parse(http_response.body).to_json).to eq BookSerializer.new(book).to_json
      end

      it { is_expected.to have_http_status(200) }
    end
  end

  describe 'GET #libros_de_gente' do
    context 'When you look a book with correct id' do
      include_context 'with authenticated user'
      let!(:book) { create(:book, rents: [create(:rent)]) }
      subject!(:http_response) { get :libros_de_gente, params: { id: book.id } }

      it { is_expected.to have_http_status(200) }
    end
  end
end
