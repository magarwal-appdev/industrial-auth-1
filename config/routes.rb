Rails.application.routes.draw do
  root "users#feed"

  devise_for :users
  
  resources :comments, only: [:edit, :create, :destroy, :update]
  resources :follow_requests, only: [:create, :destroy, :update]
  resources :likes, only: [:create, :destroy, :update]
  resources :photos, only: [:new, :edit, :create, :destroy, :update]

  get ":username" => "users#show", as: :user
  get ":username/liked" => "users#liked", as: :liked
  get ":username/feed" => "users#feed", as: :feed
  get ":username/discover" => "users#discover", as: :discover
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following
end