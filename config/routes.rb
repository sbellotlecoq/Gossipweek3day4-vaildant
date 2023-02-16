Rails.application.routes.draw do
  get '/welcome/:first_name', to: 'static_page#welcome'
  get '/team', to: 'static_page#team'
  get '/contact', to: 'static_page#contact'
  get "/sign_up", to: "sessions#new"
  post "/sign_up", to: "sessions#create"

  resources :gossips
  resources :users
  resources :gossips do
  resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :authors,  only: [:index, :show]
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  end
