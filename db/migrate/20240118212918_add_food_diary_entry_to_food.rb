class AddFoodDiaryEntryToFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :food_diary_entry, null: false, foreign_key: true
  end
end
