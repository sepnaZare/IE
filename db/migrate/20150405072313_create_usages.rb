class CreateUsages < ActiveRecord::Migration
  def change
    create_table :usages do |t|
      t.integer :user_id
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
