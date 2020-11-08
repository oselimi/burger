Rails.application.routes.draw do
  resources :costs
  resources :statistics
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :categories
  resources :orders
  resources :order_items
  resources :carts
  resources :products
  root to: 'store#index'
  get '/delivery', to: 'store#delivery'
  get '/view', to: 'store#view'
  post '/reduction', to: 'store#reduction'
  get '/balance', to: 'store#balance'
  get '/order_food', to: 'store#order_food'
  get '/costumer', to: 'store#costumer'
end
