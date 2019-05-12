class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings 
  has_one :locations_user
  has_one :location, through: :locations_user
  has_many :product_orders
  has_one_attached :picture
end
