class Food < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :name, :barcode, :created_at, presence: true
  validates :barcode, numericality: { only_integer: true }
  validates :food_diary_entry_id, numericality: { only_integer: true }, allow_nil: true
  validates :meal_id, numericality: { only_integer: true }, allow_nil: true

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :meal
  belongs_to :food_diary_entry
  has_one :nutritional_info
end
