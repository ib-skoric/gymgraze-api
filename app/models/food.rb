class Food < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :name, :barcode, presence: true
  validates :barcode, numericality: { only_integer: true }

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :meal
  has_one :nutritional_info, dependent: :destroy
  belongs_to :food_diary_entry

  accepts_nested_attributes_for :meal
  accepts_nested_attributes_for :nutritional_info

end
