class PagesController < ApplicationController
    def home
        highest_price = Listing.maximum("price")
        # Find the first listing which has the highest price.
        @highest_priced_listing = Listing.find_by(price: highest_price)
        p @highest_priced_listing
    end
end