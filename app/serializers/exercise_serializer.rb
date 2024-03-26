class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :exercise_type_id

  has_many :exercise_sets, serializer: ExerciseSetSerializer
end