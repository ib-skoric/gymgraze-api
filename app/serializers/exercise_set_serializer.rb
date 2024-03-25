class ExerciseSetSerializer < ActiveModel::Serializer
  attributes :id, :reps, :weight, :exercise_id
end
