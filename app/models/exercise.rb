class Exercise < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :user_id, presence: true

  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :user
  belongs_to :workout
  belongs_to :exercise_type
  has_many :exercise_sets, dependent: :destroy

  accepts_nested_attributes_for :exercise_sets
end
