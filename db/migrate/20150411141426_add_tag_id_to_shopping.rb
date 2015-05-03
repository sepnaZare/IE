class AddTagIdToShopping < ActiveRecord::Migration
  def change
  	add_column :shoppings, :tag_id, :integer
  end
end
