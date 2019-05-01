class Location < ApplicationRecord
    has_many :users, through: :locations_users
end
