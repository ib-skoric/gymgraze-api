class NutritionalInfo < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :kcal, presence: true, numericality: { only_integer: true }, length: { minimum: 1 }
  validates :food_id, presence: true, numericality: { only_integer: true }, allow_nil: false

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :food
  has_one :food
end
