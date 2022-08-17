 Rails.application.routes.draw do
  # get 'users/index'
  devise_for :users, :controllers => { registrations: 'users/registrations'}
  resources :marks, only: [:index, :new, :create, :show, :destroy]

  resources :hours do
    collection do
      match 'search' => 'hours#search', via: [:get, :post], as: :search
    end
  end

  get 'users', to: "users#index"
  get 'users/:id', to: "users#show"
  get 'users/:id/cards', to: "users#cards", as: "users_cards"
  get 'hours', to: "hours#index"
  get 'mark_out', to: "marks#new_out"
  patch 'card/out/:id', to: "marks#card_out_add", as: "card_out_add"
  
  root to: "marks#index"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
