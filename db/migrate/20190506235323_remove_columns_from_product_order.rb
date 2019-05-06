class RemoveColumnsFromProductOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_orders, :comment, :text
    remove_column :product_orders, :score, :integer
    remove_column :product_orders, :price, :integer
    remove_column :product_orders, :date, :date
  end
end
