class ChangeTransactionToProductOrder < ActiveRecord::Migration[5.2]
  def change
    rename_table :transactions, :product_orders
  end
end
