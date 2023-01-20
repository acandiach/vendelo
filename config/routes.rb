Rails.application.routes.draw do
  resources :categories, except: %w[show]
  resources :products, path: '/'

  namespace :authentication, path: '', as: ''do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end
end
