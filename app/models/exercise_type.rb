class ExerciseType < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :name, presence: true, length: { minimum: 2 }
  validates :exercise_category, presence: true, inclusion: { in: %w(cardio strength) }

  # ------------ MODEL ASSOCIATIONS ---------------- #
  has_many :exercises
end
