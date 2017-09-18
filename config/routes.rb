Rails.application.routes.draw do
  get 'users/new'

  resources :posts
  root to: 'posts#index'
end
