Rails.application.routes.draw do
  get 'search/index'
  # get 'items/new'
  # get 'users/new'
  root to: "items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # signout: 'users/sign_out',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items do
    collection do
      get 'destroy_all'
    end
  end

  patch 'drag/project'

  resources :bookmarks, only: [:index, :create, :destroy]

  get "dashboard", to: "users#dashboard", as: "dashboard"
  # Defines the root path route ("/")
  # root "articles#index"
end
