class PagesController < ApplicationController
    #before_action :purchased_listing_id, only:[ :success, :rating]

    def home
        # Get an array of listings that have been sold/ordered
        sold_listings = []
        product_orders = ProductOrder.all
        product_orders.each do |product_order|
            sold_listings.push product_order.listing
        end

        # Get sold listing with the highest price
        @highest_priced_sale = nil
        highest_price = 0
        sold_listings.each do |listing|
            if listing.price > highest_price
                highest_price = listing.price
                @highest_priced_sale = listing
            end
        end
      
        # Get sold listing with the lowest price
        @lowest_priced_sale = nil
        lowest_price = Listing.maximum("price") # start high and replace with lower price
        sold_listings.each do |listing|
            if listing.price < lowest_price
                lowest_price = listing.price
                @lowest_priced_sale = listing
            end
        end
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

    def privacy_policy
        
    end

    def terms

    end

    private
    def purchased_listing_id
        #@purchased_listing_id = User.find(current_user.id).product_orders.last.listing
    end
end