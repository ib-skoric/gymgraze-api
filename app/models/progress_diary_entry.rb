class ProgressDiaryEntry < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :weight, presence: true
  validates :date, presence: true, uniqueness: { scope: :user_id }

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user, dependent: :destroy
end
