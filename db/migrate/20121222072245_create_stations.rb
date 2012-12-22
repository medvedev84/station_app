class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.text :address
      t.integer :city_id

      t.timestamps
    end
  end
end
