class AddOnDeleteCascadeToExercises < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :exercises, :workouts
    add_foreign_key :exercises, :workouts, on_delete: :cascade
  end

  def down
    remove_foreign_key :exercises, :workouts
    add_foreign_key :exercises, :workouts
  end
end
