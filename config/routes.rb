Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts
  resources :users, only: [:new, :create, :index, :show]
  resource :session, only: [:new, :create, :destroy]
end