class AddCurrentItemToStore < ActiveRecord::Migration
  def change
  	add_column :stores, :current_item_id, :integer;
  end
end
