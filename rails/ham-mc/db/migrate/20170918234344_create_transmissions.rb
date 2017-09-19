class CreateTransmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :transmissions do |t|
      t.float :altitude
      t.float :latitude
      t.float :longitude
      t.float :temperature

      t.timestamps
    end
  end
end
