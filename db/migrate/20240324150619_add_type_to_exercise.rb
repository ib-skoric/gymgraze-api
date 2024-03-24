class AddTypeToExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :type, :string
  end
end
