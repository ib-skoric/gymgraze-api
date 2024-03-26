class ExerciseSet < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :reps, presence: true
  validates :weight, presence: true

  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :exercise, dependent: :destroy
  belongs_to :workout
end
