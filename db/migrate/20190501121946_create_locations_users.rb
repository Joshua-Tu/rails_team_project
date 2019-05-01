class CreateLocationsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :locations_users do |t|
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
