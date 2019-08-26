Rails.application.routes.draw do
  devise_for :users
  root to: 'menus#index'

  resources :menus do
    resources :items
  end
  resources :orders, only: [:show, :new, :create]
  resources :users
end
