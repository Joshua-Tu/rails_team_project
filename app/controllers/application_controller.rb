class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      #devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :phone_number, :username, :picture) }
      devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :phone_number, :username, :picture])
    end
end
