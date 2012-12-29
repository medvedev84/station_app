class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :country_id
      t.integer :code
      t.timestamps
    end
  end
end
