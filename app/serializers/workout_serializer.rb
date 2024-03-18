class WorkoutSerializer < ActiveModel::Serializer
  attributes :id

  has_many :exercises, serializer: ExerciseSerializer
end