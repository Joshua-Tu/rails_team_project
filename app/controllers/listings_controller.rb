<<<<<<< HEAD
class ListingsController < ActionController::Base
    before_action :set_listings, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]



    def index
        @listings = Listing.all
    end

    def create
        @listing = Listing.new(listing_params)

        respond_to do |format|
            if @listing.save
              format.html { redirect_to @listing, notice: 'Article was successfully created.' }
              format.json { render :show, status: :created, location: @listing }
            else
              format.html { render :new }
              format.json { render json: @article.errors, status: :unprocessable_entity }
            end
    end

    def new
        @listing = Listing.new
    end

    def update
    end


    def show
    end

    def edit
    end

    def destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_listings
=======
class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
>>>>>>> dev
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
<<<<<<< HEAD
      params.require(:article).permit(:title, :description)
    end
end

end
=======
      params.fetch(:listing, {})
    end
end
>>>>>>> dev
