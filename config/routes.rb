Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :coffee_shops, only: [:index]
end
