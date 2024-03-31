class AddReferenceToUserToExerciseTypes < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercise_types, :user, null: false, foreign_key: true
  end
end
