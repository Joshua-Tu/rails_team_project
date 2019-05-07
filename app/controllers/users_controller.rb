class UsersController < ApplicationController
  before_action :set_user, :set_users, :set_listings, only: [:show, :edit, :update, :index]
  before_action :authenticate_user!

  def index

  end
 
  # # GET /users/:id
  # # GET /users/1.json
  def show
    # @active_listings = []
    # @sold_listings = []
    # @user.listings.each do |listing|
    #   if listing.product_order
    #     # Listing has a product_order
    #     @sold_listings.push listing
    #   else
    #     # Listing doesn't have a product order
    #     @active_listings.push listing
    #   end
    # end
  end
  
  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_users
      @users = User.all
    end

    def set_listings
      @listings = Listing.all
    end
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:role, :user_name, :picture)
    end
 
end


