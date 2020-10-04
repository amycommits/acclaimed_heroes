Rails.application.routes.draw do
  
  root to: 'main#index'
  resources :users
  post '/issue_badge', to: 'organization#issue_badge', as: 'issue_badge'
  get '/issue_badge', to: 'organization#issue_badge', as: 'get_issue_badge'
end
