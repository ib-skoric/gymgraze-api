class Goal < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :steps, :kcal, :exercise, presence: true

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
end
