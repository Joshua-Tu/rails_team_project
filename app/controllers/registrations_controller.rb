#
#  This controller extends the Devise gem's RegistrationsController.
#
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # When a user signs up / registers:
    # If input_location matches an entity in the location table, assign that location_id to the new user.
    # ELSE create a new location with the input_location data AND assign that location to the new user.

    # Below is the entire parent class' create method
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
        p resource
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def update
    super
  end
end 
