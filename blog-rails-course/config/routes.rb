Rails.application.routes.draw do
  resources :categories
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get "bienvenida", to: "home#index"
  get "perfil", to: "users#edit"
  resources :users, only: [ :update ]

  # Simplificando 
  #   get "articles/new", to: "articles#new", as: :new_article
  #   post "articles", to: "articles#create"
  #   get "articles/:id", to: "articles#show"
  #   # Update
  #   get "articles/:id/edit", to: "articles#edit"
  #   patch "articles/:id", to: "articles#update", as: :article
  #   #Delete
  #   delete "articles/:id", to: "articles#destroy"
  #   # Todo los articulos
  #  get "articles", to: "articles#index"

  resources :articles do
    # Articulos por autor
    get "user/:user_id", to: "articles#from_author", on: :collection
  end
end
