Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :posts
  resources :users, only: [:new, :create, :index, :show]
  resource :session, only: [:new, :create, :destroy]
end