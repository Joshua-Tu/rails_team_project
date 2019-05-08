class PagesController < ApplicationController
    before_action :purchased_listing_id, only:[ :success, :rating]

    def home
        highest_price = Listing.maximum("price")
        # Find the first listing which has the highest price.
        @highest_priced_listing = Listing.find_by(price: highest_price)
      
        lowest_price = Listing.minimum("price")
        # Find the first listing which has the lowest price.
        @lowest_priced_listing = Listing.find_by(price: lowest_price)
    end
    
    def success
        # Payment/Successful Order logic is in listings#payment
        
    end

    def rating

    end

    def show_rating_form
        
    end
    
    def cancel
        
    end

    private
    def purchased_listing_id
        @purchased_listing_id = User.find(current_user.id).product_orders.last.listing_id
    end
end