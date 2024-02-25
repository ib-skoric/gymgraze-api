class AddCaloriesToWorkouts < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :calories_burned, :integer
  end
end
