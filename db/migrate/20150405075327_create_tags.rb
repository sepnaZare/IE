class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :shopping_id
      t.integer :item_id
      t.boolean :is_sold
      t.string :tag_serial

      t.timestamps null: false
    end
  end
end
