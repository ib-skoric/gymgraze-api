class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercise_category, :exercise_type_id, :duration

  def duration
    if object.duration == nil
      0
    end
  end
  has_many :exercise_sets, serializer: ExerciseSetSerializer
end