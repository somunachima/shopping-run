Rails.application.routes.draw do
  # get 'items/new'
  # get 'users/new'
  root to: "items#index"
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items
  # Defines the root path route ("/")
  # root "articles#index"
end
