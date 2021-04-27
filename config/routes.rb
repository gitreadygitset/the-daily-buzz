Rails.application.routes.draw do
  root 'coffee_shops#index'
  devise_for :users
  
  resources :coffee_shops, only: [:index, :create, :new]

  get '/coffee_shops/:id', to: 'homes#index'

  namespace :api do
    namespace :v1 do
      resources :coffee_shops, only: [:show] do
        resources :reviews, only: [:index, :create, :destroy]
      end
    end
  end
end
