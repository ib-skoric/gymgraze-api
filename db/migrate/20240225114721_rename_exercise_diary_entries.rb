class RenameExerciseDiaryEntries < ActiveRecord::Migration[7.0]
  def change
    rename_table :exercise_diary_entries, :workout_diary_entries
  end
end
