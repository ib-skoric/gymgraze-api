class RemoveExerciseIdFromWorkoutDiaryEntries < ActiveRecord::Migration[7.0]
  def change
    remove_column :workout_diary_entries, :exercise_id, :bigint
  end
end
