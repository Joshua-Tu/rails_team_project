class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
    @users = User.all
  end
 
  # # GET /users/:id
  # # GET /users/1.json
  def show
    @active_listings = []
    @sold_listings = []
    # Iterate through @user.listings
    @user.listings.each do |listing|
      if listing.product_order
        # if Listing has a product_order
        # add it to @sold_listings.
        @sold_listings.push listing
      else
        # Listing doesn't have a product order
        # add it to @active_listings.
        @active_listings.push listing
      end
    end

    @purchased_listings = []
    # Find product_orders where (buyer) user_id = @user.id.
    @purchase_orders = ProductOrder.where(user_id: @user.id)
    @purchase_orders.each do |order|
      # Add each of them to @purchased_listings
      @purchased_listings.push order.listing
    end

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
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:role, :user_name, :picture)
    end
    
 
end


