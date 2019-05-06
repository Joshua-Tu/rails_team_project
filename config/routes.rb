Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"} # use custom registrations controller
  resources :listings
  resources :users, only:[:index, :show, :edit, :update]

  # Root/Homepage
  get "/", to: "pages#home", as: "root"

  # Successful Payment Page
  get "/success", to: "listings#payment", as: "success"

  # Cancel Payment Page
  get "/cancel", to: "pages#cancel", as: "cancel"

  post "/payments", to: "listings#payment", as: "payment"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
