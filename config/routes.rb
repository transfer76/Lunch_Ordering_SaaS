Rails.application.routes.draw do
  devise_for :users
  root to: 'menus#index'

  resources :menus
  resources :orders
  resources :users
end
