class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :phone_number, :int
    add_column :users, :username, :string
    add_reference :users, :location, foreign_key: true
  end
end
