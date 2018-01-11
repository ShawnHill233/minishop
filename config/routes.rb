Rails.application.routes.draw do

  namespace :admin do
    get '/login', to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    resources :products
    resources :categories
    resources :brands
    resources :orders
    resources :banners
    resources :prototypes
  end

  mount API, at: '/api'
end
