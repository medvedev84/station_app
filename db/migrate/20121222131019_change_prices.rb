class ChangePrices < ActiveRecord::Migration
	change_table :prices do |t|
		t.remove :name, :price
		t.string :price_dt, :price_80, :price_92, :price_95
	end
end
