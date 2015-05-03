class RemoveShoppingIdFromTag < ActiveRecord::Migration
  def change
  	remove_column :tags, :shopping_id
  end
end
