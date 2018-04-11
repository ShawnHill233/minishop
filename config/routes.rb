Rails.application.routes.draw do

  devise_for :admin_users, path: 'admin/', class_name: 'Admin::User', controllers: {sessions: 'admin/sessions'}
  root to: 'admin/orders#index'
  namespace :admin do

    resources :products do
      resources :product_properties
      resources :variants
    end
    resources :categories
    resources :brands
    resources :orders do
      member do
        post :complete
      end
    end
    resources :banners
    resources :prototypes do
      member do
        get :get_property_names
      end
    end
    resources :feedbacks

    require 'sidekiq/web'
    require 'sidekiq-status/web'
    authenticate :admin_user do
      mount Sidekiq::Web => '/sidekiq'
    end
  end

  mount API, at: '/api'
end
