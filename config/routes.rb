Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts

  resources :users, only: [:index,:show]
  resources :friends, only: [:index, :create]
  patch '/friends', to: 'friends#accept'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
