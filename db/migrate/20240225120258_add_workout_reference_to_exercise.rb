class AddWorkoutReferenceToExercise < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :workout, null: true, foreign_key: true
  end
end
