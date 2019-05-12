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

  validates_presence_of     :email # optional
  validates_presence_of     :username # required
  validates_uniqueness_of   :username # required
  validates_presence_of     :phone_number
  validates_presence_of     :password, if: :password_required? # recommended
  validates_confirmation_of :password, if: :password_required? # recommended
  validates_length_of       :password, within: password_length, allow_blank: true # recommended
end
