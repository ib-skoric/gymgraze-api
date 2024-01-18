class Food < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :name, :barcode, :created_at, presence: true
  validates :barcode, numericality: { only_integer: true }

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :meal
  belongs_to :food_diary_entry
  has_one :nutritional_info
end
