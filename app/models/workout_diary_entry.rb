class WorkoutDiaryEntry < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :date, :user_id, presence: true
  validates :date, uniqueness: { scope: :user_id }

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
  has_many :workouts
end
