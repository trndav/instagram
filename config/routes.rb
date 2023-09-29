Rails.application.routes.draw do

  resources :comments
  get "posts/myposts"
  get 'home/about'
  resources :posts
  root "posts#index"  

  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy"
  end 

  devise_for :users, controllers: { registrations: "users/registrations"}
  resources :users, only: [:show]
end