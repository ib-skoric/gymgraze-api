class CreateFoodDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :food_diaries do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
