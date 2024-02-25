class AddReferenceToDiaryEntriesToExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercise_diary_entries, :exercise, foreign_key: true, null: true
  end
end
