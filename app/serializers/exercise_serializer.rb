class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercise_type, :workout_id, :user_id
end