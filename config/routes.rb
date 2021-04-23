Rails.application.routes.draw do
  root 'coffee_shops#index'
  devise_for :users

  get '/coffee_shops/:id', to: 'homes#index'

  resources :coffee_shops, only: [:index]
  
  namespace :api do
    namespace :v1 do
      resources :coffee_shops, only: [:show] do
        resources :reviews, only: [:index, :new, :create]
      end
    end
  end
end
