class ExerciseSet < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :reps, presence: true
  validates :weight, presence: true

  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :exercise
  belongs_to :workout
end
