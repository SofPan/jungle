Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  resources :about, only: [:index]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
    resources :sales, only: [:index]
  end

  resource :users, only: [:new, :create]
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
end
