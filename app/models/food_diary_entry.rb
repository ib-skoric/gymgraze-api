class FoodDiaryEntry < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #


  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :user
  has_many :meals
  has_many :foods
end
