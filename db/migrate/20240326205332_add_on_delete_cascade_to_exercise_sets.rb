class AddOnDeleteCascadeToExerciseSets < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :exercise_sets, :workouts
    add_foreign_key :exercise_sets, :workouts, on_delete: :cascade
  end

  def down
    remove_foreign_key :exercise_sets, :workouts
    add_foreign_key :exercise_sets, :workouts
  end
end
