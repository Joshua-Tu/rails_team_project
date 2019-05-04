class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.references :listing, foreign_key: true
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
