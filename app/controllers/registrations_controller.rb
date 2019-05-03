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
    super
  end

  private 

  def set_user
    @user = User.find_by(email: sign_up_params[:email])
  end

  def add_user_loaction
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
