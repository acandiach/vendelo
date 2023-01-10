Rails.application.routes.draw do
  resources :categories, except: %w[show]
  resources :products, path: '/'

  #ejemplo de como se crean las rutas para el crud
  ##delete '/products/:id', to: 'products#destroy', as: :delete_product
  ##patch '/products/:id', to: 'products#update'
  ##post '/products', to: 'products#create'
  ##get "/products/new", to: 'products#new', as: :new_product
  ##get '/products', to: 'products#index'
  ##get '/products/:id', to: 'products#show', as: :product
  ##get '/products/:id/edit', to: 'products#edit', as: :edit_product
  ##root 'products#index'
end
