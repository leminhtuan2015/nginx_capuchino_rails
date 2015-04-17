class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :postal_code
      t.references :prefectural, index: true
      t.string :city
      t.string :street
      t.string :building

      t.timestamps null: false
    end
  end
end
