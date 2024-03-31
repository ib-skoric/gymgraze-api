class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :date, :workout_diary_entry_id, :duration

  has_many :exercises, serializer: ExerciseSerializer
end