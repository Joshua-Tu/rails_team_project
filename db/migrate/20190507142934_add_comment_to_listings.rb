class AddCommentToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :comment, :text
  end
end
