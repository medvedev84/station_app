class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :name
      t.text :price
      t.integer :region_id

      t.timestamps
    end
  end
end
