Rails.application.routes.draw do
  # get 'items/new'
  # get 'users/new'
  root to: "items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items do
    collection do
      get 'destroy_all'
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
