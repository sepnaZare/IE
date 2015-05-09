class AddAvatarToStores < ActiveRecord::Migration
  def change
  	add_column :stores, :store_image, :string
  end
end
