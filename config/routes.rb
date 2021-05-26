Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products, only: [:index, :show] do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:destroy]
  resources :baskets, only: [:show, :update, :destroy]

  resources :signature, only: [:index, :show] do
    resources :subscription, only: [:create]
  end
  resources :subscription, only: [:show, :destroy]
end
