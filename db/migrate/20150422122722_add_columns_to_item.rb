class AddColumnsToItem < ActiveRecord::Migration
  def change
  	add_column :items, :item_type, :string
  	add_column :items, :item_company, :string
  	add_column :items, :item_code, :string
  end
end
