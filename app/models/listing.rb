class Listing < ApplicationRecord
  belongs_to :user
  has_one :product_order
  has_one_attached :picture
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :price, presence: true
  validates :rating, numericality: { only_integer: true }

  # validate :phone_number
end
