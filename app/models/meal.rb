class Meal < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :name, presence: true
  validates :name, length: { minimum: 3 }

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
end
