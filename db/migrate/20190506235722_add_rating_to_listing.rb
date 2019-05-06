class AddRatingToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :rating, :integer
  end
end
