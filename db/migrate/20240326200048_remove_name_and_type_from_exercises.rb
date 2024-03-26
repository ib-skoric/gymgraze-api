class RemoveNameAndTypeFromExercises < ActiveRecord::Migration[7.0]
  def change
    remove_column :exercises, :name, :string
    remove_column :exercises, :exercise_type, :string
  end
end
