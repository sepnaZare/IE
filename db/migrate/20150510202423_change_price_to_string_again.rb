class ChangePriceToStringAgain < ActiveRecord::Migration
  def change
  	change_column :items, :price, :string
  end
end
