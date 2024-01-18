class Meal < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :user_id, numericality: { only_integer: true }, allow_nil: false

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
end
