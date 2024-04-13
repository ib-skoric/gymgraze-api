class Workout < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :date, :workout_diary_entry_id, presence: true

  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :workout_diary_entry
  belongs_to :user
  has_many :exercises
end