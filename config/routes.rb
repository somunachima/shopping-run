Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # signout: 'users/sign_out',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :items, only: [:new, :index, :create, :destroy]

  resources :items do
    collection do
      get 'destroy_all'
    end
  end

  patch 'drag/item'

  resources :bookmarks, only: [:index, :create, :destroy]

  resources :bookmarks do
    collection do
      get 'destroy_all'
    end
  end

  get "saved", to: "users#saved", as: "saved"
end
