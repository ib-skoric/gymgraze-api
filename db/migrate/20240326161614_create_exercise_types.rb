class CreateExerciseTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_types do |t|
      t.string :name
      t.string :exercise_type

      t.timestamps
    end
  end
end
