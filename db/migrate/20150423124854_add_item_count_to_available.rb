class AddItemCountToAvailable < ActiveRecord::Migration
  def change
  	add_column :availables, :item_count, :integer;
  end
end
