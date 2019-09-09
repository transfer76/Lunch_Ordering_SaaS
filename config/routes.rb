Rails.application.routes.draw do
  devise_for :users
  root to: 'menus#index'

  resources :menus do
    resources :items
  end
  resources :orders, only: [:index, :show, :new, :create]
  resources :users

  namespace :api do
    namespace :v1 do
      resources :orders , only: [:index]
    end
  end
end
