class CreateFoodDiaryEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :food_diary_entries do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
