class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.text :price_dt
	  t.text :price_80
	  t.text :price_92
	  t.text :price_95
      t.integer :region_id

      t.timestamps
    end
  end
end
