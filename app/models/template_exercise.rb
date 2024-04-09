class TemplateExercise < ApplicationRecord
  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :workout_template
  belongs_to :exercise_type
end
