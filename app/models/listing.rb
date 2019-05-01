class Listing < ApplicationRecord
  belongs_to :user
  has_one :product_order
end
