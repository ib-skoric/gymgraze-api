class FoodDiaryEntry < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  # ensures date is present and unique for each user
  validates :date, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, numericality: { only_integer: true }, allow_nil: false

  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :user
  has_many :meals
  has_many :foods
end
