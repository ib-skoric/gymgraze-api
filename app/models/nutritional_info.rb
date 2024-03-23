class NutritionalInfo < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :kcal, presence: true, numericality: { only_integer: true }, length: { minimum: 1 }

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :food, dependent: :destroy
end
