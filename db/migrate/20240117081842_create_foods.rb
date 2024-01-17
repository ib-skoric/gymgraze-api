class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :barcode
      t.datetime :entered_at
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
