class WorkoutDiaryEntrySerializer < ActiveModel::Serializer
  attributes :id, :date

  has_many :workouts, serializer: WorkoutSerializer

end