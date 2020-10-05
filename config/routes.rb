Rails.application.routes.draw do
  
  root to: 'main#index'
  resources :users
  post '/issue_badge', to: 'organization#issue_badge', as: 'issue_badge'
  post '/batch_badges', to: 'organization#batch_badges', as: 'batch_badges'
  get '/issue_badge', to: 'organization#issue_badge', as: 'get_issue_badge'
  get '/batch_badges', to: 'organization#batch_badges', as: 'get_batch_badges'
end
