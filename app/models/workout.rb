class Workout < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :date, :workout_diary_entry_id, presence: true

  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :workout_diary_entry
  has_many :exercises

  accepts_nested_attributes_for :exercises
end
