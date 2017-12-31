Rails.application.routes.draw do

  namespace :admin do
    get 'brands/index'
  end

  namespace :admin do
    get 'brands/new'
  end

  namespace :admin do
    get 'brands/edit'
  end

  namespace :admin do
    get '/login', to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    resources :products
    resources :categories
    resources :brands
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
