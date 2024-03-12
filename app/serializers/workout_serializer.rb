class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :date

  has_many :exercises, serializer: ExerciseSerializer

  def date
    object.date.to_i
  end
end