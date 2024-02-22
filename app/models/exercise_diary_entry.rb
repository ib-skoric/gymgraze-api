class ExerciseDiaryEntry < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :date, :user_id, :calories_burned, presence: true
  validates :calories_burned, numericality: { only_integer: true }, length: { minimum: 1 }

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
end
