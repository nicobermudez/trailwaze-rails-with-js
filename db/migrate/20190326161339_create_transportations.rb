class CreateTransportations < ActiveRecord::Migration[5.2]
  def change
    create_table :transportations do |t|
      t.string :category
      t.string :name
      t.integer :price
      t.timestamps
    end
  end
end
