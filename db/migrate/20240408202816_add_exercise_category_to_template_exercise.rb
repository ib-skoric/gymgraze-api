class AddExerciseCategoryToTemplateExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :template_exercises, :exercise_category, :string
  end
end
