class WorkoutTemplate < ApplicationRecord
  belongs_to :user
  has_many :template_exercises
  has_many :exercise_types, through: :template_exercises
end
