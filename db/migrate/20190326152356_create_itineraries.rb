class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :description
      t.integer :budget
      t.string :departing_city
      t.string :departing_country
      t.timestamps
    end
  end
end
