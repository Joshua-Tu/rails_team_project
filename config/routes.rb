Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"} # use custom registrations controller
  resources :listings
  resources :users, only:[:index, :show, :edit, :update]

  # Root/Homepage
  get "/", to: "pages#home", as: "root"
  get "/listings/payment/success", to: "pages#success", as: "payment_success"
  get "/listings/payment/cancel", to: "pages#cancel", as: "payment_cancel"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
