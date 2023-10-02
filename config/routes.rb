Rails.application.routes.draw do
  get 'profiles/index'
  resources :likes, only: [:create, :destroy]

  resources :comments
  get "posts/myposts"
  get 'home/about'
  resources :posts
  root "posts#index"  

  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy"
  end 

  post 'users/:id/follow', to: "users#follow", as: "follow"
  post 'users/:id/unfollow', to: "users#unfollow", as: "unfollow"
  post 'users/:id/accept', to: "users#accept", as: "accept"
  post 'users/:id/decline', to: "users#decline", as: "decline"
  post 'users/:id/cancel', to: "users#cancel", as: "cancel"

  devise_for :users, controllers: { registrations: "users/registrations"}
  resources :users, only: [:show]
end