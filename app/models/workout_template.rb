class WorkoutTemplate < ApplicationRecord
  belongs_to :user
  has_many :template_exercises, dependent: :destroy
  has_many :exercise_types, through: :template_exercises

  accepts_nested_attributes_for :template_exercises
end
