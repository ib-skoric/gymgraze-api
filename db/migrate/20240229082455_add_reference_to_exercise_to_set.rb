class AddReferenceToExerciseToSet < ActiveRecord::Migration[7.0]
  def change
add_reference :set_tables, :exercise, null: false, foreign_key: true
  end
end
