class AddStoreIdToTag < ActiveRecord::Migration
  def change
  	add_column :tags, :store_id, :integer
  end
end
