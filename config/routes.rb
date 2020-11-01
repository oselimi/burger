Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :categories
  resources :orders
  resources :order_items
  resources :carts
  resources :products
  get '/store/index'
  get '/delivery', to: 'store#delivery'
  get '/view', to: 'store#view'
  post '/reduction', to: 'store#reduction'
  get '/contact', to: 'store#contact'
  get '/home', to: 'store#home'
  get '/week', to: 'store#week'
  get '/month', to: 'store#month'
  get '/year', to: 'store#year'
  get '/balance', to: 'store#balance'
  get '/all', to: 'store#all'
  get '/order_food', to: 'store#order_food'
  get 'staff', to: 'store#staff'
  get '/costumer', to: 'store#costumer'
end
