class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :ssn
      t.string :email
      t.string :mobile
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
