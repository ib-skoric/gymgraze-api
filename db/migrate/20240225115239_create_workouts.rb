class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.date :date
      t.references :workout_diary_entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
