class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :location_id
      t.datetime :date_time
      t.integer :event_type_id

      t.timestamps
    end
  end
end
