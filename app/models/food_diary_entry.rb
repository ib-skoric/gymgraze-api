class FoodDiaryEntry < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  # ensures date is present and unique for each user
  validates :date, presence: true, uniqueness: { scope: :user_id }

  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :user
  has_many :meals
  has_many :foods
end
