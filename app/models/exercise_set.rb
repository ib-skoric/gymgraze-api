class ExerciseSet < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :reps, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true

  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :exercise
  belongs_to :workout
end
