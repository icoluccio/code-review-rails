Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :book_suggestions, only: %i[create]

  resources :books, only: %i[index show] do
    collection do
      get :book_information
    end
  end

  resources :users, only:[] do
   resources :rents, only: %i[index create]
  end

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
