class CreateAvailables < ActiveRecord::Migration
  def change
    create_table :availables do |t|
      t.integer :item_id
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
