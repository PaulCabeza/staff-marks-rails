Rails.application.routes.draw do
  # get 'users/index'
  devise_for :users
  resources :marks, only: [:index, :new, :create, :show, :destroy]

  get 'users', to: "users#index"
  root to: "marks#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
