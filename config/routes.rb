Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products, only: [:index, :show] do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:destroy]
  resources :baskets, only: [:show, :update, :destroy]

  resources :signatures, only: [:index, :show] do
    resources :subscriptions, only: [:create]
  end

  resources :subscriptions, only: [:show, :checkout, :destroy]

  # post '/subscriptions/signature/:id', to: 'subscriptions#create', as: 'subscriptions'


end
