class CreateAccommodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accommodations do |t|
      t.belongs_to :destination, foreign_key: true
      t.string :name
      t.string :address
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :price_per_night
      t.timestamps
    end
  end
end
