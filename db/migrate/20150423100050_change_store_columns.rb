class ChangeStoreColumns < ActiveRecord::Migration
  def change
  	remove_column :stores, :creator_id
  	add_column :stores, :user_id, :integer
  end
end
