Rails.application.routes.draw do
  resources :marks
  root to: "marks#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
