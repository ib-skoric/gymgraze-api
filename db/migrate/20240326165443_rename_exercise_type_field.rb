class RenameExerciseTypeField < ActiveRecord::Migration[7.0]
  def change
    rename_column :exercise_types, :exercise_type, :exercise_category
  end
end
