class ProgressDiaryEntry < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :weight, presence: true
  validates :date, presence: true

  # ------------ MODEL ASSOCIATIONS --------------- #
  belongs_to :user, dependent: :destroy
end
