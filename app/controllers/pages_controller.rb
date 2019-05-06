class PagesController < ApplicationController
    def home
        highest_price = Listing.maximum("price")
        # Find the first listing which has the highest price.
        @highest_priced_listing = Listing.find_by(price: highest_price)
        
        lowest_price = Listing.maximum("price")
        # Find the first listing which has the lowest price.
        @lowest_priced_listing = Listing.find_by(price: lowest_price)
    end
    
    def success
        # Payment/Successful Order logic is in listings#payment
    end
    
    def cancel
        
    end
end