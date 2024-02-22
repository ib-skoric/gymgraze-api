class CreateExerciseDiaryEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_diary_entries do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.integer :calories_burned

      t.timestamps
    end
  end
end
