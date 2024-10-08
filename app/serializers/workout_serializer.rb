class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :date, :duration, :workout_diary_entry_id

  has_many :exercises, serializer: ExerciseSerializer
end