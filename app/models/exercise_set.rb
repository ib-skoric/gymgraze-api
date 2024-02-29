class ExerciseSet < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :reps, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true
  validates :exercise_id, presence: true


  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :exercise
end
