class Meal < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #


  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
end
