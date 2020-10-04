Rails.application.routes.draw do
  
  # devise_for :users
  resources :users
  root to: 'main#index'

  namespace :api do
    resources :users
    resources :badges
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
