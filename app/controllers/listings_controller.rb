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
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:article).permit(:title, :description)
    end
end

end