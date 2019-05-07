class UsersController < ApplicationController
  before_action :set_user, :set_users, :set_listings only: [:index, :show, :edit, :update]
  before_action :set_active_listings, :set_sold_listings, :set_purchased_listings, only: [:show]
  before_action :authenticate_user!

  def index

  end
 
  # # GET /users/:id
  # # GET /users/1.json
  def show
    # # private methods (bottom of this controller) give us access to:
    # # @active_listings (user's listings that are for sale)
    # # @sold_listings (listings the user has sold)
    # # @purchased_listings (listings purchased by the user)
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
    
    def set_active_listings
      @active_listings = []
      @user.listings.each do |listing|
        unless listing.product_order.present?
          @active_listings.push listing
        end
      end
    end

    def set_sold_listings
      @sold_listings = []
      @user.listings.each do |listing|
        if listing.product_order
          @sold_listings.push listing
        end
      end
    end
      
    def set_purchased_listings
      @purchased_listings = []
      # Find product_orders where (buyer) user_id = @user.id.
      @purchase_orders = ProductOrder.where(user_id: @user.id)
      @purchase_orders.each do |order|
        # Add each of them to @purchased_listings
        @purchased_listings.push order.listing
      end
    end
 
end


