class Exercise < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  validates :name, presence: true, length: { minimum: 2 }
  validates :exercise_type, presence: true, inclusion: { in: %w(cardio strength) }
  validates :user_id, presence: true

  # ------------ MODEL ASSOCIATIONS ---------------- #
  belongs_to :user
  belongs_to :workout, optional: true
  has_many :exercise_sets

  accepts_nested_attributes_for :exercise_sets
end
