class ChangePriceToBeIntInListings < ActiveRecord::Migration[5.2]
  def up
    change_column :listings, :price, :integer
  end

  def down
    change_column :listings, :price, :float
  end
end
