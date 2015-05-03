class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.datetime :date
      t.string :total_cost

      t.timestamps null: false
    end
  end
end
