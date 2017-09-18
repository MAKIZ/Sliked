Rails.application.routes.draw do
  resources :posts
  root to: 'posts#index'
  resources :users, only: [:new, :create, :index, :show]
end