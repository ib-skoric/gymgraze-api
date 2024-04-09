class CreateTemplateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :template_exercises do |t|
      t.references :workout_template, null: false, foreign_key: true
      t.references :exercise_type, null: false, foreign_key: true
      t.timestamps
    end
  end
end
