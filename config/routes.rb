Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"} # use custom registrations controller
  resources :listings
  resources :users, only:[:index, :show, :edit, :update]

  # Root/Homepage
  get "/", to: "pages#home", as: "root"

  post "/payments", to: "listings#payment", as: "payment"

  # Successful Payment Page
  get "/success", to: "pages#success", as: "success"
  # Cancel Payment Page
  get "/cancel", to: "pages#cancel", as: "cancel"

  # Privacy Policy Page
  get "/privacy_policy", to: "pages#privacy_policy", as: "privacy_policy"

  # Terms and Conditions Page
  get "/terms", to: "pages#terms", as: "terms"

  get "/listings/:id/rating", to: "pages#rating", as: "rating"
  
  post "/listings/:id/rating", to: "pages#set_rating"
  # post "/listings/:id/rating", to: "pages"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
