Rails.application.routes.draw do
  devise_for :users

  resources :posts
  resources :tag, only: :show
  resources :category, only: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"

  post "/fileUpload", to: 'application#upload_file'

  post "/post/search", to: 'posts#search'
end
