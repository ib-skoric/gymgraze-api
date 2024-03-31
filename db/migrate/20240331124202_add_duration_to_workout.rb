class AddDurationToWorkout < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :duration, :integer
  end
end
