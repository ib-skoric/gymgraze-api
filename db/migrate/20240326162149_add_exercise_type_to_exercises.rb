class AddExerciseTypeToExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :exercise_type, null: false, foreign_key: true
  end
end
