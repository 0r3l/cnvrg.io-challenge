Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles
  resources :cars
  resources :drivers

  root 'welcome#index'
end
