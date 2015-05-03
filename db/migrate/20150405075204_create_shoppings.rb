class CreateShoppings < ActiveRecord::Migration
  def change
    create_table :shoppings do |t|
      t.integer :usage_id
      t.integer :purchase_id

      t.timestamps null: false
    end
  end
end
