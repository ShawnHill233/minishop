Rails.application.routes.draw do

  root to: 'admin/orders#index'
  namespace :admin do
    get '/login', to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    resources :products
    resources :categories
    resources :brands
    resources :orders do
      member do
        post :complete
      end
    end
    resources :banners
    resources :prototypes
  end

  mount API, at: '/api'
end
