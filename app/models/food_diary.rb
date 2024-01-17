class FoodDiary < ApplicationRecord
  # ------------ MODEL VALIDATIONS --------------- #
  validates :user_id, presence: true

  # ------------ MODEL ASSOCIATIONS --------------- #
  has_many :meals
  belongs_to :user
end
