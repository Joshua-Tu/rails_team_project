Rails.application.routes.draw do
  devise_for :users
  # Root/Homepage
  get "/", to: "pages#home", as: "root"

  get "/listings", to: "listings#index", as: "listings"

  get "/listings/:id", to: "listings#show", as: "single_listing"

  get "/users/:id", to: "users#show", as: "user_profile"

  # Listings C.R.U.D.
  # Transactions C.U.

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
