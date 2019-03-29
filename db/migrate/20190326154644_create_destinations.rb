class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.belongs_to :itinerary, foreign_key: true
      t.string :city
      t.string :country
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :price_per_night
      t.integer :total_price
      t.string :accommodation_link
      t.timestamps
    end
  end
end
