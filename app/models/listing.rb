class Listing < ApplicationRecord
  belongs_to :user
  has_one :product_order
  has_one_attached :picture
  validates :title, :description, :price, presence: true

  # validate :phone_number
end
