class Meal < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :name, presence: true

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
end
