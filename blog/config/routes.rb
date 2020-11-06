Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles
  resources :cars
  resources :drivers
  resources :driversandcars

  root 'welcome#index'
end
