class AddColumnsToStore < ActiveRecord::Migration
  def change
  	add_column :stores, :company_name, :string
  	add_column :stores, :economic_code, :string
  	add_column :stores, :national_id, :string
  	add_column :stores, :register_number, :string
  	add_column :stores, :telephone_number1, :string
	add_column :stores, :telephone_number2, :string
	add_column :stores, :company_address, :string
	
  end
end
