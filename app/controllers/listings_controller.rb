class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :payment]
  skip_before_action :verify_authenticity_token, only: [:payment]
  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
    @purchased_listings = Listing.joins(:product_order)
    @unpurchased_listings = @listings - @purchased_listings
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @mark = @listing.show_phone
    if user_signed_in?
      unless @listing.product_order
        stripe_session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          client_reference_id: current_user.id,
          line_items: [{
            name: @listing.title,
            description: @listing.description,
            amount: @listing.price * 100, #Basic unit of stripe payment is cent.
            currency: 'aud',
            quantity: 1,
          }],
          payment_intent_data: {
            metadata: {
                listing_id: @listing.id
            }
          },
          success_url: success_url,
          cancel_url: cancel_url
        )
        @stripe_session_id = stripe_session.id
      end
    end
  end

  # GET /listings/new
  def new
    @listing = current_user.listings.build 
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create

    @listing = current_user.listings.build(listing_params)
    # The default value of the rating of the listing when created is 5
    @listing.rating = 5 
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def payment
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    ProductOrder.create(user_id: params[:data][:object]["client_reference_id"], listing_id: payment["metadata"]["listing_id"])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :price, :description, :phone_number, :picture, :show_phone, :rating)
    end

end
