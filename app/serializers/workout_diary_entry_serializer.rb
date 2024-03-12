class WorkoutDiaryEntrySerializer < ActiveModel::Serializer
  attributes :id, :date

  has_many :workouts, serializer: WorkoutSerializer

  def date
    object.date.to_i
  end
end