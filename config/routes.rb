Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "welcome#index"
  resources :collections, only: [:index, :show]
  resources :dashboard, only: [:index]
  get "/cards/:id", to: "cards#show", as: :card
  get "/cards/random", to: "cards#random_card"
  get "/coming_soon", to: "static_pages#coming_soon", as: :coming_soon

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"

  get "/auth/twitter", as: :twitter_login
  get "/auth/twitter/callback", to: "sessions#create"
end
