class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :itinerary, foreign_key: true
      t.string :title
      t.integer :rating
      t.string :comment
      t.timestamps
    end
  end
end
