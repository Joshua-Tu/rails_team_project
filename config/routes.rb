Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"} # use custom registrations controller
  resources :listings
  resources :users, only:[:index, :show, :edit, :update]

  # Root/Homepage
  get "/", to: "pages#home", as: "root"

  # Successful Payment Page
  get "/success", to: "pages#success", as: "success"

  # Cancel Payment Page
  get "/cancel", to: "pages#cancel", as: "cancel"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
