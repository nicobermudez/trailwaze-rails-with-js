class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.belongs_to :destination, foreign_key: true
      t.string :category
      t.string :name
      t.string :price
      t.timestamps
    end
  end
end
