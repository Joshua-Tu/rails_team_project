class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.integer :price
      t.date :date
      t.references :listing, foreign_key: true
      t.text :comment
      t.integer :score

      t.timestamps
    end
  end
end
