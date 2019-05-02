class Listing < ApplicationRecord
  belongs_to :user
  has_one :product_order

  # validate :phone_number
end
