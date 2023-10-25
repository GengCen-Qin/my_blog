Rails.application.routes.draw do
  get 'tag/new'
  get 'welcome/index'
  resources :posts
  resources :tag,only: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
end
