class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercise_category, :exercise_type_id

  has_many :exercise_sets, serializer: ExerciseSetSerializer
end