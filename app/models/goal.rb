class Goal < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :steps, :kcal, :exercise, presence: true
  validates :steps, :kcal, :exercise, numericality: { only_integer: true }

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
end
