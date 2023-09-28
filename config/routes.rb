Rails.application.routes.draw do
  get "posts/myposts"
  devise_for :users
  get 'home/about'
  resources :posts
  root "posts#index"

  

  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy"
  end 
end