Rails.application.routes.draw do
  get 'welcome/index'
  get 'driversandcars/match', to: 'driversandcars#match'
  post 'driversandcars/match', to: 'driversandcars#create_match'

  resources :articles
  resources :cars
  resources :drivers
  resources :driversandcars

  root 'welcome#index'
end
