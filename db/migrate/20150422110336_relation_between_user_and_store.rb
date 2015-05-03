class RelationBetweenUserAndStore < ActiveRecord::Migration
  def change
  	add_column :stores, :creator_id, :integer
  end
end
