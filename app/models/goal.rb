class Goal < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :steps, :kcal, :exercise, presence: true
  validates :steps, :kcal, :exercise, numericality: { only_integer: true }
  validates :steps, :kcal, :exercise, numericality: { greater_than_or_equal_to: 0 }

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
end
