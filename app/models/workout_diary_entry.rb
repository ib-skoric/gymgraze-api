class WorkoutDiaryEntry < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :date, :user_id, presence: true

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
  has_many :workouts
end
