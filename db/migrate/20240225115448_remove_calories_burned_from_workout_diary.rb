class RemoveCaloriesBurnedFromWorkoutDiary < ActiveRecord::Migration[7.0]
  def change
    remove_column :workout_diary_entries, :calories_burned, :integer
  end
end
