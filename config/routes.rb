Rails.application.routes.draw do
  root 'coffee_shops#index'
  devise_for :users
  resources :coffee_shops, only: [:index]
end
