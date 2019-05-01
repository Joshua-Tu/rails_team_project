class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.string :title
      t.float :price
      t.boolean :show_phone

      t.timestamps
    end
  end
end
