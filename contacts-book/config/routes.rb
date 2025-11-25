Rails.application.routes.draw do
  get "/dashboard", to: "home#dashboard"

  resources :contacts
  # get "contacts/new"
  # get "contacts", to: "contacts#index"
  # get "contacts/:id/edit", to: "contacts#edit", as: "edit_contact"
  # get "contacts/:id", to: "contacts#show", as: "contact"
  # post "contacts", to: "contacts#create"
  # patch "contacts/:id", to: "contacts#update"
  # delete "contacts/:id", to: "contacts#destroy"
end
