Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /en|pt/ do
    root to: 'pages#home'
    resources :products, only: [:index, :show] do
      resources :orders, only: [:new, :create]
    end
    resources :orders, only: [:update, :destroy] do 
      member do
        patch 'add_unit'
        patch 'reduce_unit'
      end
    end
    resources :baskets, only: [:show, :update, :destroy] do
      member do
        get 'checkout'
        patch 'checkout'
      end
    end
  
    resources :signatures, only: [:index, :show] do
      resources :subscriptions, only: [:create]
    end
  
    resources :subscriptions, only: [:show, :checkout, :destroy]
  end
end
