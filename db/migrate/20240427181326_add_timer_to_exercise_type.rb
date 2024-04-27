class AddTimerToExerciseType < ActiveRecord::Migration[7.0]
  def change
    add_column :exercise_types, :timer, :integer

    ExerciseType.update_all(timer: 90)
  end
end
