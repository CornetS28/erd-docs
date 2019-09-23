Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts

  resources :users, only: [:index,:show]
  resources :friends, only: [:create, :index, :create]
  patch '/friends', to: 'friends#accept'

  resources :likes, only: %i[create destroy]
  resources :comments, only: %i[create]
  
end
