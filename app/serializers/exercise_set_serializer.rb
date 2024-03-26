class ExerciseSetSerializer < ActiveModel::Serializer
  attributes :id, :reps, :weight, :exercise_id

  def weight
    object.weight.to_f
  end
end
