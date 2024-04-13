class ProgressDiaryEntry < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :date, presence: true, uniqueness: { scope: :user_id }

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user
end
