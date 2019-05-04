class RegistrationsController < Devise::RegistrationsController
#
#  This controller extends the Devise gem's RegistrationsController.
#
  before_action :set_user, only: [:add_user_loaction]
  after_action :add_user_loaction

  def new
    super
  end

  def create
    super
  end

  def update
    # self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    # prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    # resource_updated = update_resource(resource, account_update_params)
    # yield resource if block_given?
    # if resource_updated
    #   set_flash_message_for_update(resource, prev_unconfirmed_email)
    #   bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

    #   respond_with resource, location: after_update_path_for(resource)
    # else
    #   clean_up_passwords resource
    #   set_minimum_password_length
    #   respond_with resource
    # end 

    super

    # Custom fields are updating even when there are form errors...
    # possible solutions:
    # - Make sure custom fields are validated the same way devise's fields are
    # - Respond with error page (and 'back' link) if custom fields don't pass custom validation
    # - 
    
    p "************"
    p resource.phone_number
    p "************"
  end

  private 

  def set_user
    @user = User.find(current_user.id)
  end

  def add_user_loaction
    # if city, state and country are all present (not empty or nill)
    if params.values_at(:city, :state, :country).all?(&:present?)

      user_location = Location.find_by(
        city: params[:city],
        state: params[:state],
        country: params[:country]
      ) # => nil if not found

      if user_location != nil
        # If user_location(user input) exists in table
        # update user to associate with that location
        @user.update(location: user_location)
      else
        # user_location(user input) not found in location table
        # add a new row to the location table and associate it with user
        new_location = Location.create(
          city: params[:city], 
          state: params[:state], 
          country: params[:country]
        )
        @user.update(location: new_location)
      end

    end
  end

end 
