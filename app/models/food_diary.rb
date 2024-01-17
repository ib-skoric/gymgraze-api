class FoodDiary < ApplicationRecord
  # ------------ MODEL VALIDATIONS --------------- #


  # ------------ MODEL ASSOCIATIONS --------------- #
  has_many :meals
  belongs_to :user
end
