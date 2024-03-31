class AddDurationToExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :duration, :integer
  end
end
