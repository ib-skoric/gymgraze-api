class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercise_type

  has_many :exercise_sets, serializer: ExerciseSetSerializer
end